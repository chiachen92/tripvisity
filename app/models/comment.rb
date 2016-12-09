class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  validates :body, presence: true

  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user


end
