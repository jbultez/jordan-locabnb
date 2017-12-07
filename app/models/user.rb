class User < ApplicationRecord
  has_many :rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/png","image/jpg"] }
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 7.megabytes
  validates :lastname, presence: true, length: {maximum: 25}
  validates :firstname, presence: true, length: {maximum: 25}
end
