class VerbTensesController < ApplicationController
  protect_from_forgery with: :null_session
  
    def index
      @verb_tenses = VerbTense.all

      if params[:verb]
        @verb_tenses = @verb_tenses.where(verb_id: params[:verb])
      end

      @total_verb_tenses = @verb_tenses.count unless @verb_tenses.blank?

      render :index, status: :ok
  end

  def create
    @verb_tense = VerbTense.new(verb_tense_params)

    if @verb_tense.save
      render :show, status: :created
    else
      render json: @word.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  private

  def verb_tense_params
    params.require(:verb_tense).permit(:name, :verb_id, :yo_id, :tu_id, :el_id, :nosotros_id, :ellos_id)
  end
end