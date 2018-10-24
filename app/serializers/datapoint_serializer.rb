<<<<<<< HEAD:app/serializers/datapoint_serializer.rb
class DatapointSerializer < ActiveModel::Serializer
  attributes :id, :value, :time
  belongs_to :entries
=======
module Api::V1
  class DatapointSerializer < ActiveModel::Serializer
    attributes :id, :value, :time
    belongs_to :entry
  end
>>>>>>> branch-merge:app/serializers/api/v1/datapoint_serializer.rb
end
