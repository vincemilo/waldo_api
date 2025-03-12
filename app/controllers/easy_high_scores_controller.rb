class EasyHighScoresController < ApplicationController
  def index
    @high_scores = EasyHighScore.all

    render json: @high_scores
  end

  def create
    @high_score = EasyHighScore.new(high_score_params)

    if @high_score.save
      render json: @high_score, status: :created
    else
      render json: @high_score.errors, status: :unprocessable_entity
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def high_score_params
    params.expect(easy_high_score: [ :name, :time ])
  end
end
