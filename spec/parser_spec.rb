require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Parser" do

  subject do
    @parser ||= Bishl::Parser.new
  end

  it "should parse the standings url" do
    parse = proc{subject.parse_standings(:season => "2010", :cs => "LLA")}
    lambda{ parse.call }.should_not raise_error
    parse.call.should_not be_empty
  end

  context "schedule" do
    it "parse the schedule for given team" do
      parse = proc {subject.parse_schedule(:season => "2011", :cs => "LLA",  :team => "74")}
      lambda{parse.call}.should_not raise_error
      parse.call.first.id.should == 1058.to_s
      parse.call.should have(11).items
    end

    it "parse the next game for given team" do
      parse = proc {BISHL.next_game_for(:season => "2010", :cs => "LLA",  :team => "74")}
      parse.call.should have(0).items

      parse = proc {BISHL.next_game_for(:season => "2011", :cs => "LLA",  :team => "74")}
      parse.call.should have(1).items
    end

    context "stripped" do

      it "parse the next game for given team and returns it as a single array" do
        parse = proc {BISHL.next_game_for(:season => "2011", :cs => "LLA",  :team => "74")}
        parse.call.should have(1).items
      end

    end

    context "not stripped" do

      it "parse the next game for given team and returns it as an array" do
        parse = proc {BISHL.next_game_for(:season => "2011", :cs => "LLA",  :team => "74", :strip => false)}
        parse.call.should_not have(1).items
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