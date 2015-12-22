require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press (.+)$/ do |button|
  click_button(button)
end

When /^I click (.+)$/ do |link|
  click_link(link)
end

When /^I fill in email with "(.*?)"$/ do |value|
  fill_in('Email'.gsub(' ', '_'), :with => value)
end

When /^I fill in password with "(.*?)"$/ do |value|
  fill_in('password'.gsub(' ', '_'), :with => value)
end

And /^I fill in title with "(.*?)"$/ do |value|
  fill_in('Title'.gsub(' ', '_'), :with => value)
end

And /^I fill in date with "(.*?)"$/ do |value|
  fill_in('Date'.gsub(' ', '_'), :with => value)
end

When /^I fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  fill_in(field.gsub(' ', '_'), :with => value)
end

When /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^I check "([^\"]*)"$/ do |field|
  check(field)
end

When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

Then /^I should see "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should have_content(regexp)
end

Then /^I should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should_not have_content(regexp)
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should =~ /#{value}/
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should_not =~ /#{value}/
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  find_field(label).should be_checked
end

Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  find_field(label).should_not be_checked
end

Then /^I should be on (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

Then /^the page should have flash message (.+)$/ do | text|
  page.has_css?('.flashnotice', :text => text, :visible => true)
end

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |name,email, password|
  @user = User.new(:email => email,
                   :name=>name,
                   :password => password,
                   :password_confirmation => password)
   @user.save!
end

Given /^I am an authenticated user$/ do
  name = 'exmample'
  email = 'example@example.com'
  password = 'testtest'

  step %{I have one user "#{name}" with email "#{email}" and password "#{password}"}
  step %{I am on the login page}
  step %{I fill in email with "#{email}"}
  step %{I fill in password with "#{password}"}
  step %{I press Log in}
end

Then /^I should see a div with id starting with "([^\"]*)"$/ do |prefix|
 #assert $browser.div(:id => prefix).exists?, "could not find div with id '#{prefix}'"
 el = first("#{prefix}")
 el.click unless el.nil?
end

Then /^I should see profile$/ do
  step %(I should see a div with id starting with "user-info")
end

Then /^I should see activities$/ do
  step %(I should see a div with id starting with "activities")
end

Then /^I should see newsfeed$/ do
  step %(I should see a div with id starting with "links")
end