class Datapoint < ApplicationRecord
  belongs_to :entry

  validates_presence_of :value, :time
  #validate that datapoints are within start and end date

  scope :chronological, -> { order(:began_at) }
  scope :for_location, -> (location) { where(location: location) }

  def net_total
    total = Datapoint.all.inject(0, &:+)
  end

end
