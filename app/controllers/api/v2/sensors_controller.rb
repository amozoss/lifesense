class Api::V2::SensorsController < ApplicationController
  respond_to :json
  before_action :authenticate
  skip_before_filter :verify_authenticity_token

  def index
    respond_with @current_user.sensors
  end

  def show
    respond_with sensor
  end

  def create
		# TODO send error messages
    @sensor = @current_user.sensors.build(sensor_params)
		@sensor.save
    
    respond_with :api, status: :created, json: @sensor
  end

  def destroy
    respond_with sensor.destroy
  end

  private 

  def sensor
    @current_user.sensors.find(params[:id]) if @current_user
  end

  def sensor_params
    params.require(:sensor).permit(:name, :formula, :user_id, :pin_number)
  end
end
