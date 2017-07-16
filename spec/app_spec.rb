require 'spec_helper'
require 'dotenv/load'
require 'date'

feature "Book" do

  scenario "book a single class" do
    login
    book_class_based_on_day
    logout
  end

end

def login
  visit 'https://gymbox.legendonlineservices.co.uk/enterprise/account/Login'
  fill_in('login_Email', :with => ENV['EMAIL'])
  fill_in('login_Password', :with => ENV['PASSWORD'])
  click_button('login')
end

def book_class_based_on_day
  case Date.today.cwday
    when 7
      monday_classes
    when 1
      tuesday_classes
    when 2
      wednesday_classes
    when 3
      thursday_classes
    when 4
      friday_classes
    when 5
      saturday_classes
    when 6
      sunday_classes
  end
end

def monday_classes
 # THIS IS THE NORMAL ONE book_class(Date.new(2017,07,16), 1002373)
  book_class(Date.new(2017,07,16), 1023130)
end

def tuesday_classes
  # no classes for Tuesday
end

def wednesday_classes
  # no classes for Wednesday
end

def thursday_classes
  book_class(Date.new(2017,07,19), 1000780)
end

def friday_classes
  #no classes for Friday
end

def saturday_classes
  book_class(Date.new(2017,07,14), 1002061)
  book_class(Date.new(2017,07,14), 1002165)
end

def sunday_classes
# No classes for Sunday
end

def weeks_since(date)
  (Date.today - date).to_i / 7
end

def book_class(start_date, number)
  navigate_to_timetable
  increment = weeks_since(start_date)
  click_link("slot#{number + increment}")
  click_link('btnPayNow')
end

def navigate_to_timetable
  visit 'https://gymbox.legendonlineservices.co.uk/enterprise/BookingsCentre/MemberTimetable'
  expect(page).to have_content "Booking Timetable"
end

def logout
  click_link("My account")
  click_link("Logout")
end
