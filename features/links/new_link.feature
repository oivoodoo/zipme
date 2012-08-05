@javascript
Feature: Add a new link
  In order to create short version of link
  As an user
  I want to be able to paste link and then generate short version

  Background:
    Given I am logged in

  Scenario: User should be able to add a new link
    When I fill link form
    And I press generate button
      Then I should see generated link
      And I should see successful notification
      And I should see edit button near of generated link

