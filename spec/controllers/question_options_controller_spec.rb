require 'rails_helper'

RSpec.describe QuestionOptionsController, type: :controller do
  let(:questionnaire)    { FactoryBot.create :questionnaire }
  let(:question_group)   { FactoryBot.create :question_group, questionnaire: questionnaire }
  let(:question)         { FactoryBot.create :question, question_group: question_group }
  let!(:question_option) { FactoryBot.create :question_option, question: question }
  let(:token)            { double :acceptable? => true }

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
      get :index, params: { id: question_option.id, format: :json }
      expect(response).to be_success
    end
  end

  describe "Get question_options" do
    it "returns success" do
      get :question, params: { id: question_option.id, format: :json }
      expect(response).to be_success
    end
  end
end
