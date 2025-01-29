# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :account
  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, :email, :birthdate, presence: true
  validates :account, presence: true
end
