class Api::V2::TransmittersController < ApplicationController
  respond_to :json

  def index
    puts params
    respond_with User.find_by(id: params[:user_id]).transmitters
  end

  def show
    respond_with transmitter
  end

  def create
    puts params
  end

  def destroy
  end

  private 

  def transmitter
    Transmitter.find(params[:id])
  end


end
