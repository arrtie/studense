# frozen_string_literal: true

class Account < ApplicationRecord
  has_secure_password
  has_one :profile, dependent: :destroy, inverse_of: :account
  has_one :admin, dependent: :destroy, inverse_of: :account
  has_many :sessions, dependent: :destroy
  accepts_nested_attributes_for :profile

  normalizes :email, with: ->(e) { e.strip.downcase }
  validates :email, :password, :password_confirmation, presence: true
end
