class ListSerializer < ActiveModel::Serializer
  attributes :id, :user, :items, :user_id
end
