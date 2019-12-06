Feature: User can view sent message
    As a user
    In order to know what messages I have composed
    I want to view a sent page

  Background:
    Given the following user exist:
      | name   | email          | password | id |
      | dummy1 | user1@mail.com | password | 1  |
      | dummy2 | user2@mail.com | password | 2  |

    And the following messages exist:
      | subject       | message             | sender   | receiver |
      | To dear user2 | For ever yours      | dummy1   | dummy2   |
      | To dear user1 | Til the end of time | dummy2   | dummy1   |
    And I am logged in as "dummy1"

    Scenario: To view sent message
      When I go to the sent page
      Then I should see "For ever yours"
      And I should see "Subject: To dear user2"
      And I should see "dummy1"