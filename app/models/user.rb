class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! unless email.nil? }
  validate :name_validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validate :email_validations
  LETTER_NUMBER_MIXED = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validate :password_validations
  has_secure_password
  has_many :projects

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続的セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    remember_digest
  end

  # セッションハイジャック防止のためにセッショントークンを返す
  # 記憶ダイジェストを再利用しているのは利便性のため
  def session_token
    remember_digest || remember
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  private

    def name_validations
      if name.blank?
        errors.add(:name, 'を入力してください')
      elsif name.length > 20
        errors.add(:name, 'は20文字以内にしてください')
      end
    end

    def email_validations
      if email.blank?
        errors.add(:email, 'を入力してください')
      elsif email.length > 255
        errors.add(:email, 'は255文字を超えないようにしてください')
      elsif !email.match?(VALID_EMAIL_REGEX)
        errors.add(:email, 'は正しいものを入力してください')
      elsif User.where.not(id: id).exists?(email: email)
        errors.add(:email, 'はすでに登録されています')
      end
    end

    def password_validations
      if password.blank?
        errors.add(:password, 'を入力してください')
      elsif password.length < 10
        errors.add(:password, 'は10文字以上で入力してください')
      elsif !password.match?(LETTER_NUMBER_MIXED)
        errors.add(:password, 'は半角英数字の両方を含んでください')
      end

      if password_confirmation.blank?
        errors.add(:password_confirmation, 'を入力してください')
      end
    end
end
