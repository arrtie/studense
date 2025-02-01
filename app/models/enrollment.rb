class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student, :course, presence: true
end
