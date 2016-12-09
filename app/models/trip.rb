class Trip < ApplicationRecord
  belongs_to :user
  paginates_per 5

  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :destination, presence: true

  def self.search(keyword)
  where(["destination ILIKE ?", "%#{keyword}%"])
  end

end
