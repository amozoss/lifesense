class Api::V2::UsersController < ApplicationController
  respond_to :json
  before_action :authenticate, except: [:login]
  #skip_before_filter :verify_authenticity_token, only: [:login]

  def login
    count = 0
    @current_user = User.find_by(email: params[:email].downcase) if params[:email]
    if @current_user && @current_user.authenticate(params[:password]) || authenticate_token
      @current_user.generate_token if @current_user
      render status: :ok, json: @current_user 
    else
      render status: :unauthorized, json: 'Invalid username/password'
    end
  end

  def index
    respond_with User.all
  end

  def show
    respond_with user
  end

  def create
    respond_with :api, User.create(user_params)
  end

  def update
    respond_with user.update(lead_params)
  end

  def destroy
    respond_with user.destroy
  end

  private

  def user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
