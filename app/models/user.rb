class User < ApplicationRecord
  after_create :send_admin_mail

  has_many :ceramiques
  has_many :categories
  has_many :orders
  has_many :lessons
  has_many :bookings
  has_many :calendarupdates
  has_many :articles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_attachment :productphoto
  has_attachment :productphotomobile
  has_attachment :lessonphoto
  has_attachment :avatarphoto
  has_attachment :cityphoto
  has_attachment :logophoto # , accept: [:png]
  has_attachments :homerightphotos, maximum: 2
  has_attachment :darktheme1photo
  has_attachment :darktheme2photo
  has_attachment :darktheme3photo
  has_attachment :darktheme4photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, format: {with: Regexp.new('\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z'), message:"Adresse email invalide"}
  validates :phone, presence: true, format: {with: Regexp.new('\A(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}\z'), message:"Téléphone invalide"}
  validates_acceptance_of :consented, message: "Doit être coché"
  attr_accessor :consented

  def display_name
    return self.email
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params[:adress] = "------ à mettre à jour ------"
    user_params[:city] = "------ à mettre à jour ------"
    user_params[:country] = "FR"
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def self.user_subscribe(user_params_i)
    user_params = user_params_i.slice(:first_name, :tracking, :email)
    user_params[:first_name] ||= "newsletter"
    user_params[:adress] = "------ à mettre à jour ------"
    user_params[:city] = "------ à mettre à jour ------"
    user_params[:country] = "------ à mettre à jour ------"
    user_params[:first_name] == "newsletter" ? user_params[:last_name] = "." : user_params[:last_name] = "message"

    user = User.find_by(email: user_params[:email])
    if user
      user.update(tracking: user_params[:tracking]) if user_params[:tracking]
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]
      user.save
    end
    return user
  end

  def send_admin_mail
    SignupMailer.mail_after_signup(self).deliver_now
  end
end
