require 'rails_helper'

RSpec.describe OptionAnswersController, type: :controller do
  let(:option_answer) { FactoryBot.create :option_answer }
  let(:question_option) { option_answer.question_option }
  let(:token) { double :acceptable? => true }

  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  describe "Get index" do
    it "returns success" do
      get :index, params: { id: question_option.id, format: :json }
      expect(response).to be_success
    end
  end

  describe "Get show" do
    it "returns success" do
      get :index, params: { id: option_answer.id, format: :json }
      expect(response).to be_success
    end
  end

  describe "Get question_option" do
    it "returns success" do
      get :question_option, params: { id: option_answer.id, format: :json }
      expect(response).to be_success
    end
  end
end
