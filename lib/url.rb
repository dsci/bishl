module Bishl

  module Url

    extend self

    def base
      "http://www.bishl.de"
    end

    def source(type)
      case type
        when "standings" then "#{base}/rss/standings.xml.php"
        when "schedule" then "#{base}//rss/schedule.xml.php"
        when "logo" then "#{base}//teams.php"
      end

    end

  end
end