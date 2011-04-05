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

end