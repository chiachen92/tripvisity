class Trip < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :destination, presence: true

end
