# frozen_string_literal: true
class AddFamilyReferenceToMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :members, :family, foreign_key: true
  end
end
