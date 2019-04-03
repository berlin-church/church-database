# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'groups@berlin.church', to: 'groups@berlin.church'

  layout 'mailer'
end
