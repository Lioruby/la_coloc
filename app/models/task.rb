class Task < ApplicationRecord
  belongs_to :colocation
  has_many :assignations, dependent: :destroy
  has_many :preferences, dependent: :destroy

  validates_presence_of :name, :description, :duration
end
