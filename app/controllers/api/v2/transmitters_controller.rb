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
		# TODO send error messages
    @transmitter = @current_user.transmitters.build(name: transmitter_params["name"], transmitter_token: Transmitter.new_token)
		@transmitter.save
    
    respond_with :api, status: :created, json: @transmitter
  end

	def update
		respond_with transmitter.update(transmitter_params)
	end

  def destroy
    respond_with transmitter.destroy
  end

  private 

  def transmitter
    @current_user.transmitters.find(params[:id]) if @current_user
  end

  def transmitter_params
    params.require(:transmitter).permit(:name)
  end


end
