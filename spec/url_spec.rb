require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe "Bishl::Url" do

  it "should return the url for the bishl xml interface" do
    url = "http://www.bishl.de/rss/standings.xml.php"
    Bishl::Url.source.should == url
  end

end