class User < ApplicationRecord
  has_many :trips, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :budgets, dependent: :destroy

  has_secure_password
  before_save :downcase_email

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, length: {maximum: 30}, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :votes, dependent: :destroy
  has_many :voted_comments, through: :votes, source: :comment


  private



  def downcase_email
    self.email = email.downcase if email.present?
  end

end
