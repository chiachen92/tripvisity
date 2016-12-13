class Budget < ApplicationRecord
  belongs_to :user

  validates :item, presence: true, length: {minimum: 5}
  validates :price, presence: true

  def initialize_done
    self.status ||= false
  end

  def total
    Budget.sum(:price)
  end

end
