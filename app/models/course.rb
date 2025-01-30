# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :instructor
  has_many :students

  validates :name, :start_date, :end_date, presence: true
end
