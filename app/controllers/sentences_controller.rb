class SentencesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_sentence, except: [:create, :index]

  def index
    @sentences = Sentence.all

    if params[:sentences]
      @sentences = @sentences.where("sentence ~* ?", params[:sentences])
    end

    @total_sentences = @sentences.count unless @sentences.blank?

    render :index, status: :ok
  end

  def show
  end

  def update
    if @sentence.update(sentence_params)
      render :show, status: :ok
    else
      render json: @sentence.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  def create
    @sentence = Sentence.new(sentence_params)

    if @sentence.save
      render :show, status: :created
    else
      render json: @sentence.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  def destroy
    if @sentence.destroy
      render body: nil, status: :no_content
    else
      render json: @sentence.errors.full_messages.to_sentence, status: :not_found
    end
  end

  private

  def set_sentence
    @sentence = Sentence.find(params[:id])
  end

  def sentence_params
    params.require(:sentence).permit(:sentence, :translation, word_ids: [], themes: [])
  end
end
