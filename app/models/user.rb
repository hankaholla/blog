class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
    
  has_many :comments
  has_many :articles
  has_many :poly_likes

  validates :user_name, presence: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :email, presence: true
    
end
