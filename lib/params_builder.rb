module Bishl

  class ParamsBuilder

    class << self

      def build_link(options={})
        raise OptionsNotMetError, "season missing" unless options.has_key?(:season)
        raise OptionsNotMetError, "league missing" unless options.has_key?(:cs)

        "?season=#{options[:season]}&cs=#{options[:cs]}"
      end

    end

  end

end