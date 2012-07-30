Feature: View home page
  In order to view home page
  As an user
  I want to be able surf on website, login, logout

  Scenario: Register a new user
    Given I am on the home page

    When I follow register link
      Then I should be on the register page

    When I fill register form
    And I press register button
      Then I should be logged in

  Scenario: Login
    Given I have already created account

    When I am on the home page
    And I fill login form
    And I press login button
      Then I should be logged in

  Scenario: Logout
    Given I have already logged in

    When I am on the home page
    And I follow logout link
      Then I should be logged out

