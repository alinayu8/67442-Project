class Entry < ApplicationRecord
  belongs_to :user
  has_many :datapoints

  validates_presence_of :location, :duration, :began_at

  scope: :chronological, -> { order(:began_at) }
  scope: :for_location, -> (location) { where(location: location) }
  scope: :by_duration, -> { order(:duration) }
end
