# frozen_string_literal: true

module Approvable
  extend ActiveSupport::Concern
  included do
    has_one :admin_request, as: :approvable, touch: true
  end
end
