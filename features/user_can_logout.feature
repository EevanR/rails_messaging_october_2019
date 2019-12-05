Feature: User can logout
    As a user
    In order to avoid unauthorized use to my account
    I want to be able to logout

    Background:
        Given I am on the Login page
        And the following user exist:
            | name | email         | password |
            | user | user@user.com | password |

    Scenario: Successfully log out of account
        When I am logged in as "user"
        And I am in the inbox
        And I click on "Logout"
        Then I should see "Signed out successfully."