# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base
	has_secure_password
	before_save { |user| user.email = email.downcase }
	validates :name, presence: true, length: {minimum: 3, maximum:15}, uniqueness:true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	before_save :create_remember_token

	private
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
