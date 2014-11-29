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
    [:A0, :A1, :A2, :A4, :A5, :A6, :A7, :PF_1, :PF_2, :PF_3, :PB_3, :PC_4, :PC_5, :PC_6, :PC_7, :PD_6, :PD_7, :PF_4].each do |pin|
      @transmitter.pin_numbers.create(name: pin)
    end
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
