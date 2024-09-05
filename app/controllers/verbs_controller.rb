class VerbsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_verb, except: [:create, :index]

  def index
    @verbs = Verb.all

    if params[:verbs]
      @verbs = @verbs.where("verb ~* ?", params[:verbs])
    end

    @total_verbs = @verbs.count unless @verbs.blank?

    render :index, status: :ok
  end

  def show
  end

  def update
    if @verb.update(verb_params)
      render :show, status: :ok
    else
      render message: @verb.errors.full_messages.to_sentence, status: :bad_request
    end
  end

  def create
    @verb = Verb.new(verb_params)

    if @verb.save
      render :show, status: :created
    else
      render :bad_request
    end
  end

  def destroy
    if @verb.destroy
      render body: nil, status: :no_content
    else
      render body: @verb.errors.full_messages.to_sentence, status: :not_found
    end
  end

  private

  def set_verb
    @verb = Verb.find(params[:id])
  end

  def verb_params
    params.require(:verb).permit(:verb, :translation, :words)
  end
end
