@javascript
Feature: View links on the home page as a list
  In order to view links on the home page
  As an user
  I want to be able to see the latest generate links on the home page

  Background:
    Given I am logged in
    And I have a link

  Scenario: View link on the home page
    When I am on the home page
      Then I should see link in the list

  Scenario: Navigate to the page
    When I am on the home page
      Then I should see 0 visits

    When I follow by generated link
      Then I should be on the page that was pasted for making short version

    When I am on the home page
      Then I should see 1 visit

