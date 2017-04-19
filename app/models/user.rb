class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :send_welcome_email

  has_many :credits
  has_many :loans
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :phone, presence: true
  validates :address, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  def name
    email
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
