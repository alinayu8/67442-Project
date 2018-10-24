class Datapoint < ApplicationRecord
  belongs_to :entry

  validates_presence_of :value, :time
  validate :within_duration
  validates :value, :inclusion => {:in => [-1, 1]}

  scope :for_entry, -> (entry) { where(entry: entry) }

  def within_duration
    if ((self.entry.start_time <= self.time) && (self.time <= self.entry.end_time))
      return true
    end
    return false
  end

end
