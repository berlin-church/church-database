# frozen_string_literal: true
require 'rails_helper'

describe Member do
  let(:family) { FactoryBot.create :family }
  let(:member) { FactoryBot.create :member, family: family }

  context 'has a family' do
    it 'has reference for the family' do
      expect(member.family).not_to be_nil
    end
  end
end
