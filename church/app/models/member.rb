class Member < ApplicationRecord
  belongs_to :family
  #has_many :relatives, through: :family
end
