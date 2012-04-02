require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Parser" do

  let(:year){Time.now.year}

  subject do
    @parser ||= Bishl::Parser.new
  end

  it "should parse the standings url" do
    parse = proc{subject.parse_standings(:season => year, :cs => "LLA")}
    lambda{ parse.call }.should_not raise_error
    parse.call.should_not be_empty
  end

  context "schedule" do
    it "parse the schedule for given team" do
      parse = proc {subject.parse_schedule(:season => 2011, :cs => "LLA",  :team => "74")}
      lambda{parse.call}.should_not raise_error
      parse.call.first.id.should == 1058
      parse.call.should have(22).items
    end

    context "the next game" do

      it "parses for given team" do
        parse = proc {BISHL.next_game_for(:season => year-1, :cs => "LLA",  :team => "74")}
        parse.call.should have(0).items

        parse = proc {BISHL.next_game_for(:season => year, :cs => "LLA",  :team => "74")}
        parse.call.should have(1).items
      end

      context "stripped" do

        it "parse the next game for given team and returns it as a single array" do
          parse = proc {BISHL.next_game_for(:season => year, :cs => "LLA",  :team => "74")}
          parse.call.should have(1).items
        end

      end

      context "not stripped" do

        it "parse the next game for given team and returns it as an array" do
          parse = proc {BISHL.next_game_for(:season => year, :cs => "LLA",  :team => "74", :strip => false)}
          parse.call.should_not have(1).items
        end

      end
    end

    context "the last game" do
      it "parses for given team" do
        parse = proc{BISHL.last_game_for(:season => "2010", :cs => "LLA",  :team => "74")}
        lambda{parse.call}.should_not raise_error
        parse.call.should have(1).items
        parse.call.first.awayteam.should == "Galabau"
      end
    end

    context "logo" do
      it "fetch for team" do
        parse = BISHL.logo_for(:team => 74)
        expected = "http://www.bishl.de/img/logo/club15.png"
        parse.should == expected
      end
    end
  end

end