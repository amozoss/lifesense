class Api::V2::TransmittersController < ApplicationController
  respond_to :json
  before_action :authenticate
  skip_before_filter :verify_authenticity_token

  def index
    puts params
    respond_with @current_user.transmitters
  end

  def show
    respond_with transmitter
  end

  def create
    @transmitter = @current_user.transmitters.create!(name: transmitter_params["name"], transmitter_token: Transmitter.new_token, user_id: @current_user.id)
    
    respond_with :api, status: :created, json: @transmitter
  end

  def destroy
    respond_with transmitter.destroy
  end

  private 

  def transmitter
    Transmitter.find(params[:id])
  end

  def transmitter_params
    params.require(:transmitter).permit(:name, :user_id, :transmitter_token)
  end


end
