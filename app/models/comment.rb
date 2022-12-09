class Comment < ApplicationRecord
  include Visible

  belongs_to :article, optional: true
  belongs_to :user

  # VALID_STATUSES = ['public', 'private', 'archived']

  # validates :status, inclusion: { in: VALID_STATUSES }

  # def archived?
  #   status == 'archived'
  # end
end
