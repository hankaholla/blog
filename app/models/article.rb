class Article < ApplicationRecord
    paginates_per 5

    include Visible

    

    has_many :comments, dependent: :destroy
    has_many :poly_likes, as: :likeable
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

end
