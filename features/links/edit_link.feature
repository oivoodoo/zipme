@javascript
Feature: Add a new link
  In order to create short version of link
  As an user
  I want to be able to paste link and then generate short version

  Background:
    Given I am logged in

  Scenario: User should be able to edit generated link
    Given I have already generated links

    When I am on the home page
      Then I should see list with my generated links
      And I should see edit buttons near of the links

    When I changed details of the first link
      Then I should see changed details in the list

  Scenario: User should be able to edit only own links
    Given I have already generated links
    And someone generated links

    When I am on the home page
      Then I should not see edit link near of someone links
      And I should see edit link only for my links

