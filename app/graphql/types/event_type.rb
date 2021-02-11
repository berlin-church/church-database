class Types::EventType < Types::BaseObject
  field :id,         ID,      null: false
  field :name,       String,  null: false
  field :image_url,  String,  null: false
  field :is_visible, String,  null: false
end
