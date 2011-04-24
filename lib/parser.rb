module Bishl

  class Parser

    # opt => {:season => "2010", :cs => "LLA"}
    # Returns an array of schedule_lines
    def parse_standings(opt={})
      begin
        url = ParamsBuilder.build_link(opt)
        xml = fetch(url,"standings")
        data = []
        xml.xpath("//team").each do |inf|
        c = ScheduleLine.new

        inf.children.each do |child|
          if(child.is_a?(Nokogiri::XML::Element))
            #puts "#{child.name} - #{child.text}"
            #c.create_line({:name => child.name, :text => child.text})
            c.send("create_#{child.name}", child.text)

          end

          #c.send("#{child.name.to_s}=",child['data'])
        end
        data << c

        end
        return data
      rescue => e
        raise e
      end
    end

    def parse_schedule(opt={})
      begin
        url = ParamsBuilder.build_link(opt)
        xml = fetch(url,"schedule")
        data = []
        xml.xpath("//game").each do |line|
          g = Game.new
          line.children.each do |child|
            #puts child.text if child.name.match(/gameid/)
            if child.name.match(/startdate/)
              g.send("#{child.name}=", Chronic.parse(child.text))
            else
              g.send("#{child.name}=", child.text) if g.respond_to?(child.name.to_sym)
            end
          end
          data << g
        end
        return data
      rescue => e
        raise e
      end
    end

    private

    def fetch(url,type)
      uri = Bishl::Url.source(type) << url
      Nokogiri.XML(open(uri).read)
    end

  end
end