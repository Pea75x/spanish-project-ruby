class GameScoresController < ApplicationController
  protect_from_forgery with: :null_session

  def show
    @game_score = GameScore.find(params[:id])
  end

  def create
    @game_score = GameScore.new(score_params)

    if @game_score.save
      render :show, status: :created
    else
      render json: @game_score.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  private

  def score_params
    params.require(:game_score).permit(:game_points, :user_id, :game_id)
  end
end
