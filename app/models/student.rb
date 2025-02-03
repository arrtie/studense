# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :profile
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments

  validates :profile, presence: true

  def full_name
    "#{self.profile.last_name}, #{self.profile.first_name}"
  end
end
