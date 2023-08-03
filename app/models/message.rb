class Message < ApplicationRecord
  has_secure_token
  # attr_encrypted :content, key: ENV['MESSAGE_ENCRYPTOR_KEY'], mashall: true, iv: SecureRandom.random_bytes(15)

  attr_encrypted :content, key: ENV['ENCRYPTION_PRIMARY_KEY'], iv: :generate_iv

  enum role: { system: 0, assistant: 1, user: 2 }
  belongs_to :chat

  private

  def generate_iv
    SecureRandom.random_bytes(64)
  end
end
