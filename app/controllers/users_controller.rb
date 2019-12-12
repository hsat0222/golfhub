class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def unsubscribe
  end

  def retire
  end

  def complete
  end
end
