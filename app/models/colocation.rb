class Colocation < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :depenses, through: :users
end
