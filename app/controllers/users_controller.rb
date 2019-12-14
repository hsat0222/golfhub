class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
