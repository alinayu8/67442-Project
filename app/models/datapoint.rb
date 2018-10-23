class Datapoint < ApplicationRecord
  belongs_to :entry

  validates_presence_of :value, :time

  scope: :chronological, -> { order(:began_at) }
  scope: :for_location, -> (location) { where(location: location) }
  scope: :by_duration, -> { order(:duration) }

  def net_total
    total = Datapoint.all.each { |a| a +=}
  end

end
