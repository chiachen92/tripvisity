class Trip < ApplicationRecord
  belongs_to :user
  # paginates_per 5

  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :destination, presence: true

  def self.search(keyword)
  where(["name ILIKE ? or message ILIKE ? or email ILIKE ? or department ILIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

end
