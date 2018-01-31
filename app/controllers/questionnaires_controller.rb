class QuestionnairesController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    questionnaires = if params[:event_instance_id].blank?
                       Questionnaire.all
                     else
                       Questionnaire.where(event_instance_id: params[:event_instance_id])
                     end
    render json: JSONAPI::Serializer.serialize(questionnaires, is_collection: true)
  end

  def show
    questionnaire = Questionnaire.find_by id: params[:id]
    if questionnaire.nil?
      render json: {}, status: 404
    else
      render json: JSONAPI::Serializer.serialize(questionnaire)
    end
  end

  def question_groups
    questionnaire = Questionnaire.find_by id: params[:id]
    if questionnaire.nil?
      render json: {}, status: 404
    else
      render json: JSONAPI::Serializer.serialize(questionnaire.question_groups, is_collection: true)
    end
  end
end
