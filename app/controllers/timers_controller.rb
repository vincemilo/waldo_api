class TimersController < ApplicationController
  before_action :set_timer, only: %i[ update ]

  def create
    @timer = Timer.new(start_time: Time.current)
    if @timer.save
      render json: @timer, status: :created
    else
      render json: @timer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @timer.update(stop_time: Time.current)
    @timer.update(elapsed_time: @timer.calculate_elapsed_time)
      render json: @timer
    else
      render json: @timer.errors, status: :unprocessable_entity
    end
  end

  private
    def set_timer
      @timer = Timer.find(params.expect(:id))
    end
end
