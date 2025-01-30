# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :profile

  validates :profile, presence: true
end
