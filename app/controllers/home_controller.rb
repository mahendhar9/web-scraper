class HomeController < ApplicationController
  def welcome
    if current_user
      redirect_to movies_path
    end
  end
end
