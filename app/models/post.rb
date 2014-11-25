class Post < ActiveRecord::Base
  belongs_to :tag
  default_scope -> { order('created_at DESC') }
end
