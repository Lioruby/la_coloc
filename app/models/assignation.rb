class Assignation < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_one_attached :photo
end
