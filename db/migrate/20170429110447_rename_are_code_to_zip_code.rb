class RenameAreCodeToZipCode < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :addresses, :area_code, :zip_code
  end

  def self.down
  end
end
