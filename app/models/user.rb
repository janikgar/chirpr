class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :chirps

  mount_uploader :avatar, AvatarUploader

  serialize :following, Array

  validates :username, presence: true
  validates :username, uniqueness: true
end
