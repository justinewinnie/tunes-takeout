class SessionsController < ApplicationController

  def new
    @user
  end

  def create
    auth_hash = request.env['omniauth.auth']
    @user = auth_hash["info"]["uid"]
  end

  # def create
  #   auth_hash = request.env['omniauth.auth']
  #   if auth_hash["uid"]
  #     @user = User.find_or_create_from_omniauth(auth_hash)
  #     if @user
  #       session[:user_id] = @user.id
  #       redirect_to root_path
  #     else
  #       redirect_to root_path, notice: "Failed to save the user"
  #     end
  #   else
  #     redirect_to root_path, notice: "Failed to authenticate"
  #   end
  # end
end

# def current_weather
#    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}").parsed_response
#  end

# class MonstersController < ApplicationController
#   def index
#
#   end
#
#   def favorite
#     @monster = Pokemon.find(params[:number])
#   end
#
#   def show
#     @monster = Pokemon.find(params[:id])
#     render :favorite
#   end
# end
