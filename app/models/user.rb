class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :username, :email, :password, :password_confirmation

  
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :username
    validates_uniqueness_of :username

  before_create :generate_auth_token

  def auth_token_expired?
    auth_token_expires_at < Time.now
  end

  def generate_auth_token(expires = nil)
    self.auth_token = SecureRandom.hex(20)
    self.auth_token_expires_at = expires || 1.day.from_now
  end

  def regenerate_auth_token!(expires = nil)
    Rails.logger.info "Regenerating user auth_token"
    Rails.logger.info "  Expiration: #{expires}" if expires
    generate_auth_token(expires)
    save!
  end
  
  has_many :measures
end