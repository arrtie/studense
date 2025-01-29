# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :profile, dependent: :destroy, inverse_of: :account
  accepts_nested_attributes_for :profile
end
