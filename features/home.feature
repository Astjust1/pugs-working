Feature: Home Testing
  Users should be able to see my info, friends, and newsfeed
  
  Scenario: Visit homepage
    Given I am an authenticated user
    When I go to the home page
    Then I should see profile
        And I should see newsfeed
        And I should see activities