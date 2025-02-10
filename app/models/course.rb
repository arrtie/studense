# frozen_string_literal: true

class Course < ApplicationRecord
  # include Approvable
  has_one :admin_request, as: :approvable, touch: true

  belongs_to :instructor
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  validates :name, :start_date, :end_date, :student_limit, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
end
