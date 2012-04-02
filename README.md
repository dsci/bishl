# bishl

A tiny little ruby wrapper around the XML api of www.bishl.de .

## Installation

Installation via Bundler is easy to setup.
Put the following line to your Gemfile:

```ruby
gem "bishl"
```

To ride "cutting edge" use github as gem source:

```ruby
gem "bishl", :git => "git://github.com/dsci/bishl.git"
```

## Implementations

**Pure Ruby**

For Ruby implementation take a closer look to the RSpec files. Due to the fact that the XML API of the BISHL
website currently only supports standings for several years, getting involved with the bishl Ruby gem is very
simple:

```ruby
require "rubygems"
require "bishl"

standings = BISHL.standings(:season => "2010", :cs => "LLA")
```

Standings is an array. Every item of the array is accessible as Hash:

```ruby
standing.map(&:hashify)
```

Sample for <code>hashify</code>

```ruby
next_games = BISHL.next_game_for(:season => "2012", :cs => "LLA",  :team => "74")

p next_games.map(&:hashify)

#=> [{:startdate=>#<DateTime: 2012-04-22T18:00:00+02:00 (14736241/6,1/12,2299161)>, :hometeam=>"Pleiszegeier Leipzig", :awayteam=>"Powerkrauts Berlin", :gameid=>1423, :stadium=>"Mehrzweckhalle Taucha", :goalshome=>"", :goalsaway=>"", :overtime=>0, :shootout=>0, :awayteamid=>4, :hometeamid=>74}]  
```

Same for parsing schedule.

```ruby
require "rubygems"
require "bishl"

schedule = BISHL.schedule(:season => "2010", :cs => "LLA", :team => 74)
```

Note the additional team id.

It also gives you the opportunity to fetch the team's logo:

```ruby
  BISHL.logo_for(:team => 74)
```

which returns an url.

**Sinatra**

In your Sinatra file:

```ruby
require "rubygems"
require "bishl"

include Bishl::HtmlHelper
```

In your View:

```ruby
    <%=bishl_standings({:season => "2010", :cs => "LLA", :css =>
                                      {:table_class => "myTable",
                                       :odd_class => "myOdd",
                                       :even_class => "myEven"}
                       })%>
```

**Rails**

For rails just include the gem to your Gemfile and and follow the instruction at the Sinatra/View section.

## Possible combinations for season and league type

The creator of the BISHL website (bishl.de), Marian Strüby compiles an overview of possible combinations:

| season  | cs   |  Wettbwerb         |
|:--------|:-----|-------------------:|
|2005     | LLB  | Landesliga B       |
|2005     | JGD  | Jugend             |
|2005     | LLA  | Landesliga A       |
|2006     | LLB  | Landesliga B       |
|2006     | LLA  | Landesliga A       |
|2007     | LLA  | Landesliga A       |
|2008     | LLA  | Landesliga A       |
|2009     | LLA  | Landesliga A       |
|2010     | LLA  | Landesliga A       |
|2010     | SL   | Schülerliga        |
|2011     | LLA  | Landesliga A       |
|2012     | LLA  | Landesliga A       | 
|2011     | 1BLN | 1. Bundesliga Nord |
|2012     | 1BLN | 1. Bundesliga Nord |
|2011     | RLN  | Regionalliga Nord  |
|2011     | 1DL  | 1. Damenliga       |
|2011     | SL   | Schülerliga        |

Notice, that the bishl Ruby gem forces you to specify the season and cs params.



h2. Contributing to bishl
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

h2. Copyright

Copyright (c) 2011 Daniel Schmidt. See LICENSE.txt for further details.