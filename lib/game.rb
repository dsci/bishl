module Bishl
  class Game < Struct.new(:startdate,:hometeam,:awayteam,:gameid,:stadium,:goalshome,:goalsaway,:overtime,:shootout,
                          :awayteamid,:hometeamid)

    alias_method :date, :startdate
    alias_method :id, :gameid
    alias_method :awayteam_id, :awayteamid
    alias_method :hometeam_id, :hometeamid
    
  end
end