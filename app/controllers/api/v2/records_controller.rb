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
    puts sensor

    if sensor
      @record = sensor.records.build(x: DateTime.now.to_i * 1000, y: record_params["y"])
      if @record.save
        # only send email if lower is a valid number
        if (sensor.lower && sensor.upper && sensor.lower.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true) || (sensor.upper.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true)
          # evaluate sensor formula
          calculator = Dentaku::Calculator.new
          if sensor.formula
            formula_value = calculator.evaluate(sensor.formula, x: @record.y)
          else 
            formula_value = calculator.evaluate("x", x: @record.y)
          end

          # Send email if formula_value is below sensor lower value
          if formula_value && (formula_value < sensor.lower.to_f || formula_value > sensor.upper.to_f)
            RecordMailer.send_record(user, @record, sensor).deliver
          end
        end
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
    params.require(:record).permit(:y, :x, :transmitter_token, :pin_number)
  end

end
