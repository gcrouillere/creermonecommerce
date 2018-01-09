class User < ApplicationRecord
  after_create :send_admin_mail

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
  has_attachment :logophoto # , accept: [:png]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, format: {with: Regexp.new('\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z'), message:"Adresse email invalide"}
  validates :phone, presence: true, format: {with: Regexp.new('\A(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}\z'), message:"Téléphone invalide"}

  def display_name
    return self.email
  end

  def send_admin_mail
    SignupMailer.mail_after_signup(self).deliver_now
  end
end
