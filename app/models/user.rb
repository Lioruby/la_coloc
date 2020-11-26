class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  belongs_to :colocation
  has_many :preferences, dependent: :destroy
  has_many :assignations, dependent: :destroy

  def name
    @name = first_name
  end
end
