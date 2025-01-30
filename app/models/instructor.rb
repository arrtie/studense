# frozen_string_literal: true

class Instructor < ApplicationRecord
  belongs_to :profile
  has_many :courses

  validates :profile, presence: true
end
