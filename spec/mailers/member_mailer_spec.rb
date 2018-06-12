# require "rails_helper"
#
# RSpec.describe MemberMailer, :type => :mailer do
#   describe "notify" do
#     let(:member) { FactoryBot.create :member }
#     let(:leader) { FactoryBot.create :leader }
#     let(:mail) { MemberMailer.new_member member, leader.event_instance, 'What!' }
#
#     it "renders the headers" do
#       expect(mail.subject).to eq("Meu Evento (..) - A new member has just signed up")
#       expect(mail.to).to eq([leader.member.email, "groups@berlin.church"])
#       expect(mail.from).to eq(["groups@berlin.church"])
#     end
#
#     it "renders the body" do
#       expect(mail.body.encoded).to include("Our new member Mario Bros has just signed up for Meu Evento (..)")
#     end
#   end
# end
