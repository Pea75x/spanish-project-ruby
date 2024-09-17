class GamesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_game, except: [:create, :index]

  def index
    @games = Game.all

    @total_games = @games.count unless @games.blank?

    render :index, status: :ok
  end

  def show
  end

  def update
    if @game.update(game_params)
      render :show, status: :ok
    else
      render json: @game.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      render :show, status: :created
    else
      render json: @game.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, themes: [])
  end
end
