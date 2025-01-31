# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :profile
  has_many :enrollments

  validates :profile, presence: true
end
