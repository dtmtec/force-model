class CustomObject
  include Force::Model

  field :name
  field :description
  field :published_at, type: Time
  field :birthdate, type: Date
end
