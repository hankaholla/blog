class Comment < ApplicationRecord
  include Visible

  belongs_to :article, optional: true
  belongs_to :user
  has_many :poly_likes, as: :likeable

end
