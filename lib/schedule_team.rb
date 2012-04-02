module Bishl
  class ScheduleTeam 

    include Virtus

    attribute :teamname, String
    attribute :wins, Integer
    attribute :losses, Integer
    attribute :ties, Integer
    attribute :otwins, Integer
    attribute :otlosses, Integer
    attribute :sowins, Integer
    attribute :points, Integer
    attribute :goalsfor, Integer
    attribute :goalsagainst, Integer
    attribute :gamesplayed, Integer
    attribute :solosses, Integer

    attr_accessor :schedule

    def hashify
      self.attributes.merge!({:goals_diff => self.goals_diff})
    end

    class << self

      def create(options={})

      end

    end

    def goals_diff
      self.goalsfor.to_i - self.goalsagainst.to_i
    end

  end
end