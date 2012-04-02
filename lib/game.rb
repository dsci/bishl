module Bishl
  class Game 
    
    include Virtus

    attribute :startdate, DateTime
    attribute :hometeam, String
    attribute :awayteam, String
    attribute :gameid, Integer
    attribute :stadium, String
    attribute :goalshome, Integer
    attribute :goalsaway, Integer
    attribute :overtime, Integer
    attribute :shootout, Integer
    attribute :awayteamid, Integer
    attribute :hometeamid, Integer  

    alias_method :date, :startdate
    alias_method :id, :gameid
    alias_method :awayteam_id, :awayteamid
    alias_method :hometeam_id, :hometeamid
    
    alias_method :hashify, :attributes

  end
end