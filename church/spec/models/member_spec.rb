require 'rails_helper'

describe Member do
  let(:family) { FactoryGirl.create :family }
  let(:member) { FactoryGirl.create :member, family: family }

  context 'has a family' do
    it 'has reference for the family' do
      expect(member.family).to_not be_nil
    end
  end
end
