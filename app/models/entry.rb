class Entry < ApplicationRecord
  belongs_to :user
  has_many :datapoints

  validates_presence_of :location, :duration, :start_time

  scope: :chronological, -> { order(:start_time) }
  scope: :for_location, -> (location) { where(location: location) }
  scope: :by_duration, -> { order(((:end_time - :start_time) * 24 * 60 * 60).to_i) }
end
