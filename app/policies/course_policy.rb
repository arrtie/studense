class CoursePolicy < ApplicationPolicy
  def new?
    user.profile.instructor.present?
  end
  def create?
    user.profile.instructor.present?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
