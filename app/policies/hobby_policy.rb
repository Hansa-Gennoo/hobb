class HobbyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def create?
      true
    end

    def new?
      create?
    end

    def destroy?
      record.user == user
    end
  end
end
