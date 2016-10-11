Feature: My account functionality

  Background:
    Given Open "https://www.etundra.com" site
#9-10
#9
  Scenario: Verify that user ables to open Account popup, popup contains links and use can close this pop up
    Then Click on "Account" icon
    Then "My account" popover contains links:
      | My Account |
      | Sign In    |
    And Tap to close My Account button
   # And Verify My Account popup was closed
#10
  Scenario: User should be able to open Sign in page and correct text should be displayed
    When Click on "Account" icon
    And Click "Sign In" link
    And Verify "Sign In" side title and text
    Then Verify "Register a New Account" or "New Customer" side title and register text