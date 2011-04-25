class BISHL

  class << self

    def schedule(opt={})
      Bishl::Parser.new.parse_schedule(opt)
    end

    def standings(opt={})
      Bishl::Parser.new.parse_standings(opt)
    end


    # opt(:team => 12)
    # opt(:team => 12, :strip => false)
    # opt[:strip] is true by default
    def next_game_for(opt={})
      self.new.next_game_for(opt)
      #strip = true
      #if opt.has_key?(:strip)
      #  strip = opt.delete(:strip)
      #end
      #games = self.schedule(opt)
      #result = []
      #games.each do |game|
      #  result << game if game.date >= Time.now
      #end
      #if strip
      #  return [result.first] unless result.empty?
      #  return [] if result.empty?
      #else
      #  result
      #end
    end

    def last_game_for(opt={})
      self.new.last_game_for(opt)
    end

    def logo_for(opt={})
      # get url
      url = Bishl::Url.source("logo") + "?teamid=#{opt[:team]}"
      # parse html file for div class "logo"
      doc = Nokogiri.HTML(open(url).read)
      # get the image url from there
      doc.xpath('//div[@class="logo"]/img').each do |found|
        found.attributes.each do |attr|
          if attr.include?("src")
            logo_path = "#{Bishl::Url.base}/#{attr.last.value}"
            logo_path
            return logo_path
          end
        end
      end
    end

  end

  def method_missing(method_name,*args,&block)
    match_next = method_name.to_s.match /next_game/
    match_last = method_name.to_s.match /last_game/
    if match_last or match_next
      opt = args.pop
      strip = true
      if opt.has_key?(:strip)
        strip = opt.delete(:strip)
      end
      games = self.class.schedule(opt)
      result = []
      games.each do |game|
        result << game if game.date >= Time.now if match_next
        result << game if game.date <= Time.now if match_last
      end
      if strip and match_next
        return [result.first] unless result.empty?
        return [] if result.empty?
      elsif strip and match_last
        return [result.last] unless result.empty?
        return [] if result.empty?
      elsif not strip
        return result
      end
    else
      super
    end
  end

end