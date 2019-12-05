Feature: user can reply to message
    As a user
    In order to have conversations with my friends
    I want to be able to send replies to messages

    Background:
      Given the following user exist:
        | name   | email          | password | id |
        | dummy1 | user1@mail.com | password | 1  |
        | dummy2 | user2@mail.com | password | 2  |

    And the inbox has content
    And I am logged in as "dummy2"
    And I am in the inbox

  Scenario: User replies to message [Happy path]
    When I click on "View"
    And I fill in "Reply Message" with "Hello dummy1"
    And I click on "Reply"
    Then I should see "Your reply message was successfully sent!"
    And I should see "Hello dummy1"
    
  Scenario: User replies to message with empty text box [Sad path]
    When I click on "View"
    And I click on "Reply"
    Then I should see "Your text box is empty!"
