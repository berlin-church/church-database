class QuestionsController < ApplicationController
  before_action :doorkeeper_authorize!
  
  def index
    questions = Question.where(question_group_id: params[:question_group_id])
    render json: JSONAPI::Serializer.serialize(questions, is_collection: true)
  end

  def show
    question = Question.find_by(id: params[:id])
    render json: JSONAPI::Serializer.serialize(question)
  end

  def question_options
    question = Question.find_by(id: params[:id])
    render json: JSONAPI::Serializer.serialize(question.question_options, is_collection: true)
  end
end
