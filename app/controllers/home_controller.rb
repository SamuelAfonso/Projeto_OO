class HomeController < ApplicationController
  def index
  end
  
  def current_user
    @_current_user ||= session[:current_user_id] &&
    User.find_by(id: session[:current_user_id])
  end
end
