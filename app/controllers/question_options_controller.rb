class QuestionOptionsController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    question_options = if params[:question_id].blank?
                         QuestionOption.all
                       else
                         QuestionOption.where(question_id: params[:question_id])
                       end
    render json: JSONAPI::Serializer.serialize(question_groups, is_collection: true)
  end

  def show
    question_option = QuestionOption.find_by params[:id]
    render json: JSONAPI::Serializer.serialize(question_option)
  end

  def question
    question_option = QuestionOption.find_by params[:id]
    render json: JSONAPI::Serializer.serialize(question_option.question)
  end
end
