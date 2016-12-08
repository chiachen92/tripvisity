class Budget < ApplicationRecord
  belongs_to :user

  validates :item, presence: true
  validates :price, presence: true

  def initialize_done
    self.status ||= false
  end

end
