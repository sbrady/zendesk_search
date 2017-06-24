Feature: Searching organizations
  As a Zendesk admin
  I want to find an organization


  Scenario: Finding an organization by id
    Given a "organization" exists with the id "101"
    And I have started the app
    And I have selected to search Zendesk
    When I select "organizations"
    And I enter search term "_id"
    And I enter search value "101"
    Then I can see the organization with id "101"
