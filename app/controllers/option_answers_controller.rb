class OptionAnswersController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    answers = OptionAnswer.where(question_option_id: params[:id])
    render json: JSONAPI::Serializer.serialize(answers, is_collection: true)
  end

  def show
    answer = OptionAnswer.find_by(id: params[:id])
    render json: JSONAPI::Serializer.serialize(answer)
  end

  def question_option
    answer = OptionAnswer.find_by(id: params[:id])
    render json: JSONAPI::Serializer.serialize(answer.question_option)
  end
end
