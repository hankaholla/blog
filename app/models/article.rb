class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy
    has_many :poly_likes, as: :likeable
    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

    # VALID_STATUSES = ['public', 'private', 'archived']

    # validates :status, inclusion: { in: VALID_STATUSES }

    # def archived?
    #     status == 'archived'
    # end

end
