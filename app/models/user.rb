class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  belongs_to :colocation, optional: true
  has_many :preferences, dependent: :destroy
  has_many :assignations, dependent: :destroy
  has_many :depenses, dependent: :destroy
  has_many :tasks, through: :assignations

  validates :first_name, presence: true

  def name
    @name = first_name
  end

  def profil
    if self.photo.attached?
      self.photo.key
    else
      'profil_qk9l7e'
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
