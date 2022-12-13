class Comment < ApplicationRecord
  include Visible

  belongs_to :article, optional: true
  belongs_to :user
  has_many :poly_likes, as: :likeable

  # VALID_STATUSES = ['public', 'private', 'archived']

  # validates :status, inclusion: { in: VALID_STATUSES }

  # def archived?
  #   status == 'archived'
  # end
end
