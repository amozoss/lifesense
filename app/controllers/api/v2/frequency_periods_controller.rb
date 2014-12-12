class Api::V2::FrequencyPeriodsController < ApplicationController
  respond_to :json
  before_action :authenticate

  def index
    respond_with FrequencyPeriod.all
  end

  def show
    respond_with frequency_period
  end

  def create
    respond_with :api, status: :created, json: FrequencyPeriod.create(frequency_period_params)
  end

	def update
		respond_with frequency_period.update(frequency_period_params)
	end

  def destroy
    respond_with frequency_period.destroy
  end

  private 

  def frequency_period
    FrequencyPeriod.find(params[:id])
  end

  def frequency_period_params
    params.require(:frequency_period).permit(:id, :name)
  end
end
