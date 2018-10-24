class Entry < ApplicationRecord
  belongs_to :user
  has_many :datapoints

  validates_presence_of :longitude, :latitude, :end_time, :start_time

  scope :chronological, -> { order(:start_time) }
  scope :for_location, lambda { |params| where(latitude: params[0]).where(longitude: params[1]) }
  scope :by_duration, -> { order(((:end_time - :start_time) * 24 * 60 * 60).to_i) }
end
