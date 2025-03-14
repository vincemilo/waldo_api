class MedHighScoresController < ApplicationController
  def index
    @high_scores = MedHighScore.all

    render json: @high_scores
  end

  def create
    @high_score = MedHighScore.new(high_score_params)

    if @high_score.save
      render json: @high_score, status: :created
    else
      render json: @high_score.errors, status: :unprocessable_entity
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def high_score_params
    params.expect(med_high_score: [ :name, :time ])
  end
end
