class Api::V1::TemperaturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @temperatures = Temperature.all
    render json: @temperatures
  end

  def show
    @temperature = Temperature.order("created_at").last
    render json: @temperature
  end

  def create
    @temperature = Temperature.new(temperature_params)
    if @temperature.save
      render json: @temperature, status: :created
    else
      render json: @temperature.errors, status: :unprocessable_entity
    end
  end

  private

  def temperature_params
    params.require(:temperature).permit(:value)
  end
end
