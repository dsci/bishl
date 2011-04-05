module Bishl

  class Parser

    # opt => {:season => "2010", :cs => "LLA"}
    # Returns an array of schedule_lines
    def parse_standings(opt={})
      begin
        url = ParamsBuilder.build_link(opt)
        xml = fetch(url)
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

    private

    def fetch(url)
      uri = Bishl::Url.source << url
      Nokogiri.XML(open(uri).read)
    end

  end
end