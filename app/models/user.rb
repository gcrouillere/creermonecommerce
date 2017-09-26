class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :ceramiques
  has_many :categories
  has_many :orders
  has_many :lessons
  has_many :bookings
  has_many :calendarupdates

  has_attachment :productphoto
  has_attachment :productphotomobile
  has_attachment :lessonphoto
  has_attachment :avatarphoto
  has_attachment :cityphoto
  has_attachment :logophoto, accept: [:png]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, format: {with: Regexp.new('\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z'), message:"Adresse email invalide"}

  def display_name
    return self.email
  end
end
