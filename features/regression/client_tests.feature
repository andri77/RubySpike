@client @regression
Feature: As a user I want to be able to create and edit client

  Background:
    Given I am at login page
    And I search for "3406"
    And I click on the first agent
    Then I should be directed to client manager page
    When I login as a staff member

  @create-vendor @smoke
  Scenario: As a Portplus user, I want to be able to create a new vendor
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new vendor
    And as a staff member, I am able to fill in the form with the following:
      | fName     | Auto            |
      | lName     | Run           |
      | mobile    | 0421211111      |
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |
      | email     | autotest@autotest.com   |
    And I will be directed to Calendar Page

  @edit-vendor
  Scenario: As a Portplus user, I want to be able to edit the vendor
    And as a staff member, I can search for a vendor "Auto Run"
    And as a staff member, I can select the agent
    And as a staff member, I can "edit" the vendor details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |
    And I should wait for "3" seconds
    And as a staff member, I can select the agent's pyhsical address
    And as a staff member, I can "confirm" the vendor details with the following:
      | street         | suburb   | state | postcode  |
      | 2 test street  | Sydney   | NSW   | 2000      |

  @create-buyer @smoke
  Scenario: As a Portplus user, I want to be able to create a new vendor
    And as a staff member, I select to add a client
    And as a staff member, I am able to select my options for the new buyer
    And as a staff member, I am able to fill the buyer form with the following:
      | fName     | Autobuy         |
      | lName     | Agent           |
      | mobile    | 0421211111      |
      | street    | testing street  |
      | suburb    | Melbourne       |
      | state     | VIC             |
      | postcode  | 3000            |
      | country   | Australia       |
      | email     | autobuy@autotest.com   |
      | min_price   | 0       |
      | max_price   | 1000000       |
    And I will be directed to Calendar Page

