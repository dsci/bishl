module Bishl

  module HTMLHelper
  # opt => {:season => "2010", :cs => "LLA", :css =>
  #             {:table_class => "myTable", :odd_class => "myOdd",:even_class => "myEven"
  #         }
  #
    def bishl_standings(opt={})
    begin
      opt[:table_class] = "" unless opt.has_key?(:table_class)
      opt[:odd_class] = "" unless opt.has_key?(:odd_class)
      opt[:even_class] = "" unless opt.has_key?(:even_class)

      parser = Bishl::Parser.new
      data = parser.parse_standings(:season => opt[:season], :cs => opt[:cs])
      puts data.size
      head = <<-HTML
        <table class="#{opt[:table_class]}">
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
          <tr class="#{opt[css_klass_for_line(entry.position)]}">
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
    rescue => e
      "<div></div>"
    end

    def css_klass_for_line(pos)
      pos.to_i.even? ? :even_class : :odd_class
    end

  end
end