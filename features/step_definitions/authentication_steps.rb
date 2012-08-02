Given /^I am logged in$/ do
  @user = create(:user)

  steps %Q{
    When I am on the home page
    And I follow login link
    And I fill login form
    And I press login button
    And I am on the home page
  }
end

