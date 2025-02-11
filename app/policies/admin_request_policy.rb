# frozen_string_literal: true

class AdminRequestPolicy < ApplicationPolicy
  def index?
    is_admin?
  end

  def show?
    is_admin?
  end
end
