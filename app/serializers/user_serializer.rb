
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email


  def attributes
    data = super
    # scope defaults to current_user in UsersController
    data[:token] = object.token if scope.id == object.id
    data
  end
end
