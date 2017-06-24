Feature: Searching Tickets
  As a Zendesk admin
  I want to find a ticket
  So that I can understand the issue

  Scenario: Finding a ticket by id
    Given a "ticket" exists with the id "436bf9b0-1147-4c0a-8439-6f79833bff5b"
    And I have started the app
    And I have selected to search Zendesk
    When I select "tickets"
    And I enter search term "_id"
    And I enter search value "436bf9b0-1147-4c0a-8439-6f79833bff5b"
    Then I can see the ticket with id "436bf9b0-1147-4c0a-8439-6f79833bff5b"

