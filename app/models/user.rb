class User < ApplicationRecord
  before_save { email.downcase! unless email.nil? }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: {message: 'はすでに登録されています'}
  LETTER_NUMBER_MIXED = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, length: { minimum: 10 }, format: { with: LETTER_NUMBER_MIXED, message: 'は半角英数字の両方を含んでください' }
  validates :password_confirmation, presence: true
  has_secure_password
end
