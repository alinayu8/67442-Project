class DatapointSerializer < ActiveModel::Serializer
  attributes :id, :value, :time
  belongs_to :entries
end
