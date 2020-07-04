class Tenant < ApplicationRecord
  has_secure_password
  before_create :create_remember_token
  after_create :create_tenant

  validates :password, length: { in: 6..20 }

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end

  private

  # User生成時、before_createコールバックから呼び出す。
  def create_remember_token
    self.remember_token = Tenant.encrypt(Tenant.new_remember_token)
  end

  def create_tenant
    Apartment::Tenant.create(name)
  end
end
