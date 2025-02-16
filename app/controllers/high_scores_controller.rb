class HighScoresController < ApplicationController
  def index
    @high_scores = HighScore.all

    render json: @high_scores
  end

  def create
    @high_score = HighScore.new(high_score_params)

    if @high_score.save
      render json: @high_score, status: :created, location: @high_score
    else
      render json: @high_score.errors, status: :unprocessable_entity
    end
  end
end
