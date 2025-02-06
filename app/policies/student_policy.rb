class StudentPolicy < ApplicationPolicy
  def new?
    !student_present?
  end

  def destroy?
    false
    # student_present? and user.profile.student == student
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  private

  def student_present?
    user.profile.student.present?
  end
end
