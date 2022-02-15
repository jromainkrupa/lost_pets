class Pet < ApplicationRecord
  SPECIES = ["dog", "cat", "snake", "humans"]

  validates :name, presence: true
  validates :species, inclusion: { in: SPECIES }
  validate :found_on_before_today

  def found_on_before_today
    if self.found_on > Time.zone.now
      errors.add(:found_on, "should be found in the past")
    end
  end
end
