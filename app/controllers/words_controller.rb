class WordsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_word, except: [:create, :index]

  def index
    @words = Word.all

    if params[:words]
      @words = @words.where("word ~* ?", params[:words])
    end

    @total_words = @words.count unless @words.blank?

    render :index, status: :ok
  end

  def show
  end

  def update
    if @word.update(word_params)
      render :show, status: :ok
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      render :show, status: :created
    else
      render :bad_request
    end
  end

  def destroy
    if @word.destroy
      render body: nil, status: :no_content
    else
      render body: @word.errors.full_messages.to_sentence, status: :not_found
    end
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:word, :translation, :verb_id, sentence_ids: [], themes: [])
  end
end
