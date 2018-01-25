class User < ApplicationRecord
  has_many :rooms
  has_many :reservations
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/png","image/jpg"] }, default_url: "/images/default_image.png"
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 7.megabytes
  validates :lastname, presence: true, length: {maximum: 25}
  validates :firstname, presence: true, length: {maximum: 25}

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
        u.firstname = auth.info.first_name
        u.lastname = auth.info.last_name
        u.provider = auth.provider
        u.uid = auth.uid
        u.email = auth.info.email
        u.image = auth.info.image
        u.password = Devise.friendly_token[0,20]
    end
  end
end
end
