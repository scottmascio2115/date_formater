require 'spec_helper.rb' # It will load the configuration you set in spec_helper.rb

describe 'lets make a sign home page' do
  before(:each) do
    visit '/'
  end

  it 'should make a sign with monday times ' do
    fill_in 'day1', :with => 'monday'
    fill_in 'time1', :with => '11-5'
    click_button 'Make Sign'

    page.should have_content("Monday: 11-5")
  end

  it 'should make a sign my company name ' do
    fill_in 'day1', :with => 'monday'
    fill_in 'time1', :with => '11-5'
    fill_in 'store', :with => "Neo"
    click_button 'Make Sign'

    page.should have_content("Monday: 11-5")
    page.should have_content("NEO")
  end

  it 'should not make a sign that says save more if I dont fill in my company name ' do
    fill_in 'day1', :with => 'monday'
    fill_in 'time1', :with => '11-5'

    click_button 'Make Sign'

    page.should have_content("Monday: 11-5")
    page.should_not have_content("Always SAve More At")
  end

  it 'should make a sign made with monday time as closed ' do
    fill_in 'day1', :with => 'monday'
    fill_in 'time1', :with => 'closed'
    click_button 'Make Sign'

    page.should have_content("Monday: closed")
  end

  it 'should make a sign with the days sorted properly ' do
    fill_in 'day1', :with => 'friday'
    fill_in 'day2', :with => 'monday'
    fill_in 'day3', :with => 'thursday'
    fill_in 'day4', :with => 'tuesday'
    fill_in 'day5', :with => 'sunday'
    fill_in 'day6', :with => 'saturday'
    fill_in 'day7', :with => 'wednesday'
    fill_in 'time1', :with => 'closed'
    fill_in 'time2', :with => '1-5'
    fill_in 'time3', :with => '6-7'
    fill_in 'time4', :with => '2-5'
    fill_in 'time5', :with => '8-8'
    fill_in 'time6', :with => '12-4'
    fill_in 'time7', :with => 'closed'
    click_button 'Make Sign'

    within('.formatted ul li:first-child') { expect(page).to have_content("Sunday: closed") }
  end

  it 'should not let you fill in anything but a proper day ' do
    fill_in 'day1', :with => 'neo'
    fill_in 'time1', :with => '11-5'
    click_button 'Make Sign'

    page.should have_content("Please retry this slot. You did not input a proper day.")
  end

  it 'should not let you create signs without a time' do
    fill_in 'day1', :with => 'monday'
    click_button 'Make Sign'

    page.should_not have_content("Monday")
  end
end
