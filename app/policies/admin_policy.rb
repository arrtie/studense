# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  def index?
    is_admin?
  end

  def new?
    is_admin?
  end

  def show?
    is_admin?
  end

  def create?
    is_admin?
  end

  def destroy?
    is_admin?
  end

  private

  def is_admin?
    user.admin.present?
  end
end
