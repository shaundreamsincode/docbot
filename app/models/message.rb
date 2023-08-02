class Message < ApplicationRecord
  has_secure_token
  attr_encrypted :content, key: ENV['MESSAGE_ENCRYPTOR_KEY'], mashall: true, iv: SecureRandom.random_bytes(15)

  enum role: { system: 0, assistant: 1, user: 2 }
  belongs_to :chat
end
