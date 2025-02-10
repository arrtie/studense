class EnrollmentPolicy < ApplicationPolicy
  def new?
    user.profile.student.present? || is_admin?
  end

  def create?
    user.profile.student.present? || is_admin?
  end
end
