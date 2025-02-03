# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :account
  has_one :student, dependent: :destroy
  has_one :instructor, dependent: :destroy

  validates :first_name, :last_name, :birthdate, presence: true
  validates :account, presence: true
end
