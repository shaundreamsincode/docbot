class Summary < ApplicationRecord
  has_secure_token
  encrypts :content

  belongs_to :chat
end
