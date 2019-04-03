class Types::EventType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :image_url, String, null: true
  field :is_visible, Boolean, null: true
end
