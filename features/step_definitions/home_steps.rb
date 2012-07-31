Given /^I am on the home page$/ do
  visit '/'
end

When /^I follow register link$/ do
  click_on "Sign up"
end

Then /^I should be on the register page$/ do
  current_path.should match(/\/sign_up/)
end

When /^I fill register form$/ do
  fill_in "user[email]", :with => "fred@example.com"
  fill_in "user[password]", :with => "123456"
end

When /^I press register button$/ do
  within 'form' do
    click_on "Sign up"
  end
end

Then /^I should be logged in$/ do
  within('.container .nav') do
    page.should have_content('fred@example.com')
  end
end

Given /^I have already created account$/ do
  @user = create(:user)
end

When /^I follow login link$/ do
  click_on "Login"
end

Then /^I should be on the login page$/ do
  current_path.should match(/\/login/)
end

When /^I fill login form$/ do
  fill_in "email", :with => "fred@example.com"
  fill_in "password", :with => "123456"
end

When /^I press login button$/ do
  within 'form' do
    click_on 'Sign in'
  end
end

Given /^I have already logged in$/ do
  @user = create(:user)

  steps %Q{
    When I am on the home page
    And I follow login link
    And I fill login form
    And I press login button
  }
end

When /^I follow logout link$/ do
  within '.container .nav' do
    click_on 'Logout'
  end
end

Then /^I should be logged out$/ do
  within('.container .nav') do
    page.should_not have_content('fred@example.com')
  end
end

Given /^I am on the login page$/ do
  visit '/login'
end

When /^I click on the logo$/ do
  click_on 'Zipme'
end

Then /^I should be on the home page$/ do
  current_path.should match(/\/$/)
end
