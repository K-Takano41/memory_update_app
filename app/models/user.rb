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

  private

  def self.find_or_create_form_auth(auth)
    uid = auth[:uid]
    name = auth[:info][:name]
    if auth[:info][:email].present?
      email = auth[:info][:email]
    else
      email = "sample#{uid}@example.com"
    end

    self.find_or_create_by(email: email) do |user|
      user.name = name
      user.email = email
      user.password = Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
      user.password_confirmation = user.password
    end
  end
end
