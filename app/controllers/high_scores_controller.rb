class HighScoresController < ApplicationController
  def index
    @high_scores = HighScore.all

    render json: @high_scores
  end

  def create
    @timer = Timer.find(high_score_params[:time])
    @high_score = HighScore.new(name: high_score_params[:name], time: @timer.elapsed_time)

    if @high_score.save
      render json: @high_score, status: :created
    else
      render json: @high_score.errors, status: :unprocessable_entity
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def high_score_params
    params.expect(high_score: [ :name, :time ])
  end
end
