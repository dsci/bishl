module Bishl

  module HTMLHelper
  # opt => {:type => :small, :season => "2010", :cs => "LLA", :css =>
  #             {:table_class => "myTable", :odd_class => "myOdd",:even_class => "myEven"
  #         }
  #
    def bishl_standings(opt={})
    begin
      table_class =  ""
      odd_class = ""
      even_class = ""
      type = opt.has_key?(:type) ? opt[:type] : :large
      if opt.has_key?(:css)
        table_class = opt[:css][:table_class] if opt[:css].has_key?(:table_class)
        odd_class = opt[:css][:odd_class] if opt[:css].has_key?(:odd_class)
        even_class = opt[:css][:even_class] if opt[:css].has_key?(:even_class)
      end

      parser = Bishl::Parser.new
      data = parser.parse_standings(:season => opt[:season], :cs => opt[:cs])

      return no_data_fetch(table_class) if data.empty?

      self.send(type, data,table_class,odd_class,even_class)
      

    end
    rescue => e
      no_data_fetch(opt[:table_class])
    end

    private

    def css_klass_for_line(opt={})
      opt[:pos].to_i.even? ? opt[:even] : opt[:odd]
    end

    def no_data_fetch(css_klass)
      "<div class=\"#{css_klass}\">No data found</div>"
    end

    def small(data,table_class,odd_class,even_class)
      head = <<-HTML
        <table class="#{table_class}">
          <thead>
            <tr>
              <th>Pos</th>
              <th>Team</th>
              <th>GS</th>
              <th>Pkt</th>
            </tr>
          </thead>
      HTML
      body = "<tbody>"
      data.each do |entry|
        body += <<-HTML
          <tr class="#{css_klass_for_line({:index => entry.position, :even => even_class, :odd => odd_class})}">
            <td>#{entry.position}</td>
            <td>#{entry.team.teamname}</td>
            <td>#{entry.team.gamesplayed}</td>
            <td>#{entry.team.points}</td>
          </tr>
        HTML
      end
      body += "</tbody></table>"
      "#{head}#{body}"
    end

    def large(data,table_class,odd_class,even_class)
      head = <<-HTML
        <table class="#{table_class}">
          <thead>
            <tr>
              <th>Pos</th>
              <th>Team</th>
              <th>GS</th>
              <th>S</th>
              <th>N</th>
              <th>U</th>
              <th>SV</th>
              <th>NV</th>
              <th>SP</th>
              <th>NP</th>
              <th>P</th>
              <th>GT</th>
              <th>TD</th>
              <th>+/-</th>
            </tr>
          </thead>
      HTML
      body = "<tbody>"
      data.each do |entry|
        body += <<-HTML
          <tr class="#{css_klass_for_line({:index => entry.position, :even => even_class, :odd => odd_class})}">
            <td>#{entry.position}</td>
            <td>#{entry.team.teamname}</td>
            <td>#{entry.team.gamesplayed}</td>
	          <td>#{entry.team.wins}</td>
	          <td>#{entry.team.losses}</td>
	          <td>#{entry.team.ties}</td>
	          <td>#{entry.team.otwins}</td>
	          <td>#{entry.team.otlosses}</td>
	          <td>#{entry.team.sowins}</td>
	          <td>#{entry.team.solosses}</td>
	          <td>#{entry.team.points}</td>
	          <td>#{entry.team.goalsfor}</td>
	          <td>#{entry.team.goalsagainst}</td>
	          <td>#{entry.team.goals_diff}</td>
          </tr>
        HTML
      end
      body += "</tbody></table>"
      "#{head}#{body}"
    end

  end
end