class User < ApplicationRecord
  authenticates_with_sorcery!
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[\W_])[!-~]{8,}+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :password, length: { minimum: 8}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  enum role: { general: 0, admin: 1 }
end
