require 'spec_helper'
require 'dotenv/load'
require 'date'

feature "index" do
  before :each do
    login
  end

  scenario "Go to Timetable" do
  end

end

def login
  visit 'https://gymbox.legendonlineservices.co.uk/enterprise/account/Login'
  expect(page).to have_content "Members Area"
  fill_in('login_Email', :with => ENV['EMAIL'])
  fill_in('login_Password', :with => ENV['PASSWORD'])
  click_button('login')
  expect(page).to have_content "My Home"
  visit 'https://gymbox.legendonlineservices.co.uk/enterprise/BookingsCentre/MemberTimetable'
end
