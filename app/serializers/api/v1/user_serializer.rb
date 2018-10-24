module Api::V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email
    has_many :entries
  end
end