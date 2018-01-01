class QuestionGroupsController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    question_groups = if params[:question_id].blank?
                        QuestionGroup.all
                      else
                        QuestionGroup.where(questionnaire_id: params[:questionnaire_id])
                      end
    render json: JSONAPI::Serializer.serialize(question_groups, is_collection: true)
  end

  def questions
    question_group = QuestionGroup.find_by params[:id]
    render json: JSONAPI::Serializer.serialize(question_group.questions, is_collection: true)
  end
end
