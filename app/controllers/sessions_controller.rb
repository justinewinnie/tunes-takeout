require 'pry'
class SessionsController < ApplicationController

  def new
    @user
  end

  def create
    auth_hash = request.env['omniauth.auth']
    # binding.pry
    if auth_hash[:uid]
      @user = User.find_or_create_by_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to root_path, notice: "Failed to save the user"
      end
    else
      redirect_to root_path, notice: "Failed to authenticate"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
  #
  # def failure
  #   render :text => "Sorry, but you didn't allow access to our app!"
  # end
end
