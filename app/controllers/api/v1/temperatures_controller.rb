class Api::V1::TemperaturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @temperatures = current_user.temperatures.all
    render json: @temperatures
  end

  def show
    if current_user.temperatures.count > 0
      @temperature = current_user.temperatures.order("created_at").last
      if authorized?
        render json: @temperature
      else
        handle_unauthorized
      end
    else
      render json: { errors: "this user does not have any temperatures taken yet." }
    end
  end

  def create
    @temperature = current_user.temperatures.build(temperature_params)
    if authorized?
      if @temperature.save
        render json: @temperature, status: :created
      else
        render json: @temperature.errors, status: :unprocessable_entity
      end
    else
      handle_unauthorized
    end
  end

  private

  def temperature_params
    params.require(:temperature).permit(:value)
  end

  def authorized?
    @temperature.user == current_user
  end

  def handle_unauthorized
    unless authorized?
      render json: { errors: "You are not authorized to perform this action." }, status: 401
    end
  end
end
