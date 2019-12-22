class RoundsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :sort, :show]
  before_action :correct_round, only: [:edit, :update, :destroy, :approval, :refuse]

  def myrounds
    @member_rounds = UsersRound.joins(:round).where(user_id: current_user.id, approval_flag: "1").order("rounds.round_date ASC")
    @apply_rounds = UsersRound.joins(:round).where(user_id: current_user.id, approval_flag: "0").order("rounds.round_date ASC")
  end

  def history
    @joined_rounds = UsersRound.joins(:round).where(user_id: current_user.id, approval_flag: "1").order("rounds.round_date DESC")
  end

  def index
    @rounds = Round.where("round_date > ?", Date.current).order("round_date ASC").page(params[:page]).per(10)
    @regions = Region.all
  end

  def search
    if params[:region_id] == '9'
      r_d = params[:round_date] + '-01'
      r_d = r_d.to_date
      @rounds = Round.where(round_date: r_d.beginning_of_month..r_d.end_of_month)
      @rounds = Kaminari.paginate_array(@rounds).page(params[:page]).per(10)
      @regions = Region.all
    else
      @rounds = Round.joins(prefecture: :region).select("rounds.*").where("region_id LIKE ? AND round_date LIKE ?","%#{params[:region_id]}%","%#{params[:round_date]}%")
      @rounds = Kaminari.paginate_array(@rounds).page(params[:page]).per(10)
      @regions = Region.all
    end
    render :index
  end

  def sort
    if params[:sort_type] == "1"
      @rounds = Round.where("round_date > ?", Date.current).order('round_date ASC').page(params[:page]).per(10)
      @regions = Region.all
      render :index
    elsif params[:sort_type] == "2"
      @rounds = Round.where("round_date > ?", Date.current).order('id ASC').page(params[:page]).per(10)
      @regions = Region.all
      render :index
    end
  end

  def show
    @round = Round.find(params[:id])
    @master = @round.users_rounds.first
    if user_signed_in?
      @user_round = UsersRound.where(user_id: current_user.id).where(round_id: @round.id)
      @member = UsersRound.where(user_id: current_user.id).where(round_id: @round.id).where(approval_flag: "1")
    end
    @comments = Comment.where(round_id: @round.id).order('id DESC')
    @members = UsersRound.where(round_id: @round.id).where(approval_flag: "1")
    @apply = UsersRound.where(round_id: @round.id).where(approval_flag: "0")

    @lat = @round.map.latitude
    @lng = @round.map.longitude
    @place = @round.map.place
  end

  def new
    @round = Round.new
    @round.build_map
    @prefecture = Prefecture.all
  end

  def map
  end

  def create
    @round = Round.new(round_params)
    @map = Map.find_by(place: params[:round][:map_attributes][:place])
    if @map
      @round.map_id = @map.id
    else
     @round.build_map(place: params[:round][:map_attributes][:place])
    end
    @round.users_rounds.build([{user_id: current_user.id, approval_flag: 1}])
    if  @round.save
      redirect_to round_path(@round)
    else
      @prefecture = Prefecture.all
      render :new
    end
  end

  def edit
    @round = Round.find(params[:id])
    @prefecture = Prefecture.all
    @map = Map.all
  end

  def update #ラウンド情報編集
    @round = Round.find(params[:id])
    @map = Map.find_by(place: params[:round][:map_attributes][:place])
    if @map
      @round.map_id = @map.id
    else
      @round.build_map(place: params[:round][:map_attributes][:place])
    end
    if @round.update(round_params)
      redirect_to round_path(@round)
    else
      @prefecture = Prefecture.all
      render :edit
    end
  end

  def destroy #ラウンド削除
    @round = find(params[:id])
    @round.destroy
    redirect_to rounds_path
  end

  def apply #参加申請
    @round = Round.find(params[:id])
    @round.users_rounds.create([{user_id: current_user.id, round_id: @round.id, approval_flag: 0}])
    redirect_to round_path(@round)
  end

  def approval #参加承認
    @round = Round.find(params[:round_id])
    @users_round = UsersRound.find_by(user_id: params[:user_id], round_id: @round.id)
    @users_round.update(approval_flag: 1)
    redirect_to round_path(@round)
  end

  def refuse #参加拒否
    @round = Round.find(params[:round_id])
    @users_round = UsersRound.find_by(user_id: params[:user_id], round_id: @round.id)
    @users_round.destroy
    redirect_to round_path(@round)
  end

  private

  def round_params
    params.require(:round).permit(
                                  :map_id,
                                  :prefecture_id,
                                  :round_title,
                                  :round_date,
                                  :round_intro,
                                  :recruitment_sex,
                                  :capacity,
                                  map_attribute:[:id, :place]
                                  )
  end

  def users_round_params
    params.require(:users_round).permit(:user_id, :round_id, :approval_flag)
  end

  def correct_round
    round = Round.find(params[:id])
    master = round.users_rounds.first
    if current_user != master.user
      redirect_to round_path(round)
    end
  end

end
