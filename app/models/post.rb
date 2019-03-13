class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :weblink, :description, presence: true,
                    length: { minimum: 5 }
end
