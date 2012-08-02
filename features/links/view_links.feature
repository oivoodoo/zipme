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

