class User < ActiveRecord::Base
  validates :email, :session_token, :presence, :uniqueness
  validates :password_digest, :presence
  validates :password, length: {minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_sesssion_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = User.generate_sesssion_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_sesssion_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by(email)
    return nil if @user.nil?
    BCrypt::Password.new(self.password_digest).is_password?(password) ? @user : nil
  end

end
