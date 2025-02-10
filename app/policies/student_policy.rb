class StudentPolicy < ApplicationPolicy
  def new?
    missing_student?
  end

  def create?
    missing_student?
  end

  def destroy?
    false
  end

  private

  def missing_student?
    user.profile.student.nil?
  end
end
