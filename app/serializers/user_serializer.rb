
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :admin

  has_many :transmitters

  def attributes
    data = super
    # scope defaults to current_user in UsersController
    data[:token] = object.token if scope.id == object.id
    data
  end
end
