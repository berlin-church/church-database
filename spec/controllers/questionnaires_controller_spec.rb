require 'rails_helper'

RSpec.describe QuestionnairesController, type: :controller do
  let!(:event) { FactoryBot.create :event }
  let(:token) { double :acceptable? => true }
  let(:questionnaire) { FactoryBot.create :questionnaire }
  let(:question_groups) { FactoryBot.create :question_group, questionnaire: questionnaire }

  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  describe "Get index" do
    it "returns success" do
      get :index, params: { format: :json }
      expect(response).to be_success
    end
  end

  describe "Get show" do
    it "returns success" do
      get :index, params: { id: questionnaire.id, format: :json }
      expect(response).to be_success
    end
  end

  describe "Get question_groups" do
    it "returns success" do
      get :question_groups, params: { id: questionnaire.id, format: :json }
      expect(response).to be_success
    end
  end
end
