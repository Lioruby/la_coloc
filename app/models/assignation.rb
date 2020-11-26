class Assignation < ApplicationRecord
  belongs_to :user
  belongs_to :task, optional: true
  has_one_attached :photo
end
