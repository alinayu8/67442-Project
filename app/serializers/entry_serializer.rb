<<<<<<< HEAD:app/serializers/entry_serializer.rb
class EntrySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :start_time, :duration, :latitude, :longitude
  has_many :datapoints
  belongs_to :user
end
=======
module Api::V1
  class EntrySerializer < ActiveModel::Serializer
    attributes :id, :user_id, :start_time, :duration, :latitude, :longitude
    has_many :datapoints
    belongs_to :user
  end
end
>>>>>>> branch-merge:app/serializers/api/v1/entry_serializer.rb
