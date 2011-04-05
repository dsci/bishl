require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FormHelper" do

  include Bishl::HTMLHelper

  it "should generate an html table output" do
    output = bishl_standings(:season => "2010", :cs => "LLA")
    output.should include("<table")
    output.should include("Pos")
  end

  it "should render an info message if no data could be fetched" do
    output = bishl_standings({:season => "2009", :cs => "1BLN", :css => {:table_class => "foo"}})
    output.should == "<div class=\"foo\">No data found</div>"
  end

end