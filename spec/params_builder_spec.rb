require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ParamsBuilder" do

  context "for league standings" do

    it "should build correct link for 2010 and Landesliga" do
      expected = "?season=2010&cs=LLA"
      result = Bishl::ParamsBuilder.build_link({:season => "2010", :cs => "LLA"})
      result.should == expected
    end

    it "should build correct link for 2011 and 1.Bundesliga Nord" do
      expected = "?season=2011&cs=1BLN"
      result = Bishl::ParamsBuilder.build_link({:season => "2011", :cs => "1BLN"})
      result.should == expected
    end

  end

  context "for league standings" do

    context "forcing attributes" do

      it "should raise an OptionsNotMetError" do

        expect{Bishl::ParamsBuilder.build_link}.to raise_error Bishl::OptionsNotMetError
        expect{Bishl::ParamsBuilder.build_link(:cs => "LLA")}.to raise_error Bishl::OptionsNotMetError
        expect{Bishl::ParamsBuilder.build_link(:season => "2010")}.to raise_error Bishl::OptionsNotMetError

      end

    end

  end


end