module Bishl

  class ParamsBuilder

    class << self

      def build_link(options={})
        raise OptionsNotMetError, "season missing" unless options.has_key?(:season)
        raise OptionsNotMetError, "league missing" unless options.has_key?(:cs)

        url = "?season=#{options[:season]}&cs=#{options[:cs]}"
        if options.has_key?(:team)
          url = "#{url}&team=#{options[:team]}"
        end
        return url
      end

    end

  end

end