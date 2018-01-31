require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let!(:event) { FactoryBot.create :event }
  let(:token) { double :acceptable? => true }

  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  describe "Get index" do
    it "returns success" do
      get :index, { format: :json }
      expect(response).to be_success
    end
  end

  describe "Get show" do
    it "returns success" do
      get :index, { format: :json }
      expect(response).to be_success
    end
  end
end
