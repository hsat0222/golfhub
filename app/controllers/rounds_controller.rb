class RoundsController < ApplicationController
  before_action :correct_round, only: [:edit, :update]

  def myrounds
    @member_rounds = UsersRound.where(user_id: current_user.id).where(approval_flag: "1")
    @apply_rounds = UsersRound.where(user_id: current_user.id).where(approval_flag: "0")
  end

  def index
    @rounds = Round.all.order("id DESC").page(params[:page]).per(2)
    @pref_region = Prefecture.find([1,8,14,23,30,36,40,48])
  end

  def search
    # @prefecture = Prefecture.where("pref_region LIKE ?", "%#{params[:pref_region]}%")
    # @rounds = []
    #   @prefecture.each do |pref|
    #       pref.rounds.each do |round|
    #           @rounds << round
    #       end
    #   end
    # @users_rounds = @rounds.where(:approval_flag == 1).count
    # @rounds = Kaminari.paginate_array(@rounds).page(params[:page]).per(2)
    # render :index
  end

  def sort
  end

  def show
    @round = Round.find(params[:id])
    @master = @round.users_rounds.first
    if user_signed_in?
    @user_round = UsersRound.where(user_id: current_user.id).where(round_id: @round.id)
    @member = UsersRound.where(user_id: current_user.id).where(round_id: @round.id).where(approval_flag: "1")
    end
    @comments = Comment.where(round_id: @round.id)
    @members = UsersRound.where(round_id: @round.id).where(approval_flag: "1")
    @apply = UsersRound.where(round_id: @round.id).where(approval_flag: "0")

    @lat = @round.map.latitude
    @lng = @round.map.longitude
  end

  def new
    @round = Round.new
    @round.build_map
    @prefecture = Prefecture.all
  end

  def map
    results = Geocoder.search(params[:place])
    @latlng = results.first.coordinates
    # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。

    respond_to do |format|
      format.js
    end
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
    render :new
    end
  end

  def edit
    @round = Round.find(params[:id])
    @prefecture = Prefecture.all
    @map = Map.all
  end

  def update
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
    render :edit
    end
  end

  def destroy
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
