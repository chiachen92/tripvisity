class Budget < ApplicationRecord
  belongs_to :user

  validates :item, presence: true
  validates :price, presence: true

  def initialize_done
    self.status ||= false
  end

  # def self.total_price
  #   all.map { |item| item.price }.sum
  # end

  def total
    Budget.sum(:price)
  end

end
