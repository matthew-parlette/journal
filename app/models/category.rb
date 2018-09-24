class Category < ApplicationRecord
  belongs_to :user
  has_many :task, :dependent => :destroy
  has_many :event, :dependent => :destroy
  has_many :note, :dependent => :destroy
end
