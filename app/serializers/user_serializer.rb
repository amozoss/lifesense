
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :admin #, :links
  
  has_many :transmitters
  has_many :sensors

  def attributes
    data = super
    # scope defaults to current_user in UsersController
    data[:token] = object.token if scope.id == object.id
    data
  end

  #def links
    #{ transmitters: "/api/users/#{object.id}/transmitters" }
  #end
end
