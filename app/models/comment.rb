class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  validates :body, presence: true

end
