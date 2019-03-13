class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :comment, presence: true,
                    length: { minimum: 10 }
end
