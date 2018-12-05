# == Schema Information
#
# Table name: leaders
#
#  id                :integer          not null, primary key
#  member_id         :integer
#  event_instance_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Leader < ApplicationRecord
  belongs_to :member
  belongs_to :event_instance
end
