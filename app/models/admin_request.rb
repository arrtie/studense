# frozen_string_literal: true

class AdminRequest < ApplicationRecord
  delegated_type :approvable, types: %w[ Course Enrollment ], dependent: :destroy
  enum :status, { pending: 0, approved: 1, denied: 2 }, default: :pending, validate: true
end
