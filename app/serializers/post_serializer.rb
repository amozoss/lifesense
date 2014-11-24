class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :updated_at

  has_one :tag
end
