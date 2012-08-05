@javascript
Feature: See offline, online status on the home page as notification
  In order to see status of my internet connection
  As an user
  I want to be able to see in offline message about go to internet

  Scenario: In offline
    When I am on the home page
      Then I should not see offline status message

    When my internet connection go down
      Then I should see offline status message

    When my internet connection come back
      Then I should not see offline status message

