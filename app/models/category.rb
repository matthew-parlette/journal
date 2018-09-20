class Category < ApplicationRecord
  belongs_to :user
  has_many :task
  has_many :event
  has_many :note
end
