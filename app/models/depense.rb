class Depense < ApplicationRecord
  belongs_to :user

  validates_presence_of :montant, :name
end
