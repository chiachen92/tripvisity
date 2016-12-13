class User < ApplicationRecord
  has_many :trips, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :budgets, dependent: :destroy

  has_secure_password
  before_save {self.email = email.downcase}

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, length: {maximum: 30}, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :votes, dependent: :destroy
  has_many :voted_comments, through: :votes, source: :comment

  def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
 end





end
