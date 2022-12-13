class User < ApplicationRecord
    
    has_many :comments
    has_many :articles

    validates :user_name, presence: true
    validates :password, presence: true, length: { minimum: 5 }
    
end
