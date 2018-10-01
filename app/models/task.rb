class Task < ApplicationRecord
  belongs_to :category
  before_update :handle_mark_change, if: :mark_changed?
  enum mark: { not_marked: 0, rescheduled: 1, progressed: 2, done: 3, cancelled: 4 }

  validates :name, :presence => true

  private

  def handle_mark_change
    if mark_change[1] == "rescheduled"
      self.date = nil
    end
  end
end
