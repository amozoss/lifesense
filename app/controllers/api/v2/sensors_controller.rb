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

  def update
    param = sensor_params
    pin = param["pin_number"]
    pin = param["pin_number"]["id"] if !pin.nil?
    cwde = param["clockwork_database_event"] 
    puts "*******************************88"
    puts param
    update_clockwork_database_event(cwde)

    respond_with sensor.update_attributes(name: param["name"],
                                          pin_number_id: pin,
                                          formula: param["formula"],
                                          lower: param["lower"],
                                          upper: param["upper"],
                                          led: param["led"])
  end

  def destroy
    respond_with sensor.destroy
  end

  private

  def sensor
    @current_user.sensors.find(params[:id]) if @current_user
  end

  def sensor_params
<<<<<<< HEAD
    params.require(:sensor).permit(:id, :name, :formula,, :led, :lower, :user_id, pin_number: [:id])

    params.require(:sensor).permit(:id,
                                   :name,
                                   :formula,
                                   { clockwork_database_event:[:at, :frequency_quantity, { frequency_period: [:id, :name] } ] },
                                   :led,
                                   :lower,
                                   :upper,
                                   :user_id,
                                   pin_number: [:id])
  end

  def update_clockwork_database_event(cw_params)
    if cw_params
      cw = ClockworkDatabaseEvent.find_by(cw_params["id"])
      puts cw_params["frequency_period"]
      puts cw_params["frequency_period"]["name"]
      fp = FrequencyPeriod.find_by(name: cw_params["frequency_period"]["name"])
      puts fp
      cw.update_attributes(frequency_quantity: cw_params["frequency_quantity"], frequency_period: fp)

      puts cw
    end
  end
end
