class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :lastname, presence: true, length: {maximum: 25}
  validates :firstname, presence: true, length: {maximum: 25}
end
