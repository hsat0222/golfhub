class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def unsubscribe
  end

  def retire
    current_user.update(delete_flag: 1)
    Devise.sign_out_all_scopes ? sign_out : sign_out(current_user)
    redirect_to retire_complete_path
  end

  def complete
  end
end
