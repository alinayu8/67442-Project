<<<<<<< HEAD:app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :entries
end
=======
module Api::V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email
    has_many :entries
  end
end
>>>>>>> branch-merge:app/serializers/api/v1/user_serializer.rb
