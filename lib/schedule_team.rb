module Bishl
  class ScheduleTeam < Struct.new(:teamname, :wins,:losses, :ties,:otwins,
                                  :otlosses,:sowins,:points,:goalsfor,
                                  :goalsagainst,:gamesplayed,:solosses)

    class << self

      def create(options={})

      end

    end

    def goals_diff
      self.goalsfor.to_i - self.goalsagainst.to_i
    end

  end
end