Feature: searchable fields
  As a Zendesk admin
  I want to see the searchable
  So that I can know which fields to search by

  Scenario: Listing all fields
    Given I have started the app
    When I select to search view list of searchable fields
    Then I can see the list of user fields
    And I can see the list of ticket fields
    And I can see the list of organization fields
