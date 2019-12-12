class HomeController < ApplicationController
  def top
    @rounds = Round.last(4)
    @users = User.last(4)
  end

  def about
  end
end
