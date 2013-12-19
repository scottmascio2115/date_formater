require 'spec_helper.rb' # It will load the configuration you set in spec_helper.rb

describe 'lets make a sign home page' do
  before(:each) do
    visit '/'
  end
  it "should load the home page" do # the first test

    page.should have_content("Lets Make a Sign")
  end

  it "should show the date" do

    page.should have_content("December")
  end

  it "should let you choose a font" do

    page.should have_content("Raleway")
    page.should have_content("Lobster")
    page.should have_content("Shadows Into Light")
    page.should have_content("Open Sans Condensed")
  end
end
