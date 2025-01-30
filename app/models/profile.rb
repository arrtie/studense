# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :account
  validates :first_name, :last_name, :birthdate, presence: true
  validates :account, presence: true
end
