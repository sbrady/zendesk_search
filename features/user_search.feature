Feature: Searching Users
  As a Zendesk admin
  I want to find a user
  So that I can contact them

  Background:
    Given a "user" exists with the id "4"
    And I have started the app
    And I have selected to search Zendesk
    When I select "users"

  Scenario: Finding a user by id
    When I enter search term "_id"
    And I enter search value "4"
    Then I can see the user with id "4"

  Scenario: Failing to search for a user
    When I enter search term "not_the_search_term_your_looking_for"
    Then I can see an error message
    When I enter search term "_id"
    And I enter search value "4"
    Then I can see the user with id "4"

