class TimersController < ApplicationController
  before_action :set_timer, only: %i[ update ]

  def create
    @timer = Timer.new(timer_params)

    if @timer.save
      render json: @timer, status: :created, location: @timer
    else
      render json: @timer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @timer.update(timer_params)
      render json: @timer
    else
      render json: @timer.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timer
      @timer = Timer.find(params.expect(:id))
    end

    def timer_params
      params.expect(timer: [ :start_time, :end_time ])
    end
end
