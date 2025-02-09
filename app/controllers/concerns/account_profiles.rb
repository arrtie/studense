# frozen_string_literal: true

module AccountProfiles extend ActiveSupport::Concern
                       included do
                         def get_profile
                           Profile.includes(:student, :instructor).find_by(account_id: Current.account.id)
                         end

                         def get_profiles
                           @profile = self.get_profile
                           @student =  @profile.student
                           @instructor =  @profile.instructor
                         end
                       end
end
