class Api::V2::RecordsController < ApplicationController
  respond_to :json
  before_action :authenticate, except: [:create]
  skip_before_filter :verify_authenticity_token

  def show
    respond_with record
  end

  def create
    # TODO send error messages
    puts "*********************************************"
    puts record_params
    transmitter = Transmitter.find_by(transmitter_token: record_params["transmitter_token"]) 
    user = User.where(id: transmitter.user_id).first

    pin_number = transmitter.pin_numbers.find_by(name: record_params["pin_number"])
    sensor = pin_number.sensor if pin_number

    if sensor
      @record = sensor.records.build(time_stamp: DateTime.now.to_i * 1000, value: record_params["value"])
      if @record.save
        # SEND EMAIL
        # TODO add check if new record value is within sensor bounds
        RecordMailer.hello_world(user).deliver
      end
    end

    respond_with :api, status: :created, json: @record
  end

  def update
    respond_with record.update(transmitter_params)
  end

  def destroy
    respond_with record.destroy
  end

  private

  def record
    Record.find(params[:id])
  end

  def record_params
    # make additional required params
    params.require(:record).require(:transmitter_token)
    params.require(:record).require(:pin_number)
    # setup for hash structure
    params.require(:record).permit(:value, :time_stamp, :transmitter_token, :pin_number)
  end

end
