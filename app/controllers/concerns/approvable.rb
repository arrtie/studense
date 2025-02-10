# frozen_string_literal: true

module Approvable
  extend ActiveSupport::Concern

  included do
    def create_admin_request(id:, approvable_type:)
      AdminRequest.create(approvable_id: id, approvable_type:, status: :pending)
    end
  end
end
