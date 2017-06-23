Feature: Searching Users
  As a Zendesk admin
  I want to find a user
  So that I can contact them


  Scenario: Finding a user by id
    Given a user exists with the id "4"
    And I have started the app
    And I have selected to search Zendesk
    When I select "users"
    And I enter search term "_id"
    And I enter search value "4"
    Then I can see the user with id "4"

