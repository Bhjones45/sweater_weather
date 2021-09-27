class BackgroundSerializer
  include JSONAPI::Serializer
  set_type :image
  attributes :info
end
