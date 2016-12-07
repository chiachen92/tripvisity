class User < ApplicationRecord
  has_many :trips, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :budgets

  has_secure_password
  before_save {self.email = email.downcase}

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, length: {maximum: 30}, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i




end
