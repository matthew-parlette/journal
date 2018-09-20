class Task < ApplicationRecord
  belongs_to :category
  enum mark: { not_marked: 0, rescheduled: 1, progressed: 2, done: 3 }
end
