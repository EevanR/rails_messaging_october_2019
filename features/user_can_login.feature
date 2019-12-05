Feature: Login to mailbox
    As a user
    In order to access my mailbox
    I want to login

    Background:
        Given I am on the Login page
        And the following user exist:
            | name | email         | password |
            | user | user@user.com | password |

    Scenario: Successfully log in to mailbox [Happy path]
        When I fill in "Email" with "user@user.com"
        And I fill in "Password" with "password"
        And I click on "Log in"
        Then I should see "Signed in successfully."
    
    Scenario: Incorrect email [Sad path]
        When I fill in "Email" with "user@wrong.com"
        And I fill in "Password" with "password"
        And I click on "Log in"
        Then I should see "Invalid Email or password"
    
    Scenario: Incorrect password [Sad path]
        When I fill in "Email" with "user@user.com"
        And I fill in "Password" with "notpassword"
        And I click on "Log in"
        Then I should see "Invalid Email or password"
