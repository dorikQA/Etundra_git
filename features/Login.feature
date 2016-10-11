@login
Feature: Login functionality

  Background:
    Given Open "https://www.etundra.com" site
#11-18

 #11
  Scenario Outline: User should be able Sign In with valid credentials, error handling verification
    Then Click on "Account" icon
    Then Click "Sign In" link
     #empty email and password
    And Tap "Sign In" button
    And Verify error message "The Email field is required." displayed
    And Verify error message "The Password field is required." displayed
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    And Verify user on "Home page" page
    When Click on "Account" icon
    Then Verify "<username>" displayed
    Examples:
      | email                 | password  | username |
      | t.d.etundra@gmail.com |123456 | Tatsiana |

#12
@wip
  Scenario Outline: Forgot password functionality- combination of scenarios
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Click "Forgot your password?" link
    And Verify user on "Forgot Password" page
    And  "Forgot Password" page should display title, correct messages, buttons and "<valid_email>" if required
    Then Tap "Reset Password" button
    Then Verify error message "The Email Address field is required" displayed
    Then Enter "<invalid_email>" for resetting password
    Then Tap "Reset Password" button
    And Verify user on "Forgot Password" page
    Then Enter "<valid_email>" for resetting password
    Then Tap "Reset Password" button
    And Verify user on "Reset Password" page
    And "Reset Password" page should display title, correct messages, buttons and "<valid_email>" if required
    Examples:
      | valid_email           | invalid_email     |
      | t.d.etundra@gmail.com | invalid@gmail.com |
# 13

  Scenario: User registration verification -User registration with valid random data
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Enter First Name
    And Enter Last Name
    Then Enter Email
    And Enter Phone Number
    And Enter Password
    And Enter Retyped
    Then From dropdown select "Restaurant" company business type
    And Enter Company Name
    Then Tap "Register" button
    And Verify user on "Home page" page
    When Click on "Account" icon
    Then Verify correct username displayed
# 14

  Scenario: User registration page - Errors handling verification
    Then Click on "Account" icon
    Then Click "Sign In" link
  #    Then Verify that user on "Sign In" page
    Then Tap "Register" button
    And Verify error message "The First name field is required" displayed
    And Verify error message "The Last name field is required" displayed
    And Verify error message "The Email field is required" displayed
    And Verify error message "The Phone field is required" displayed
    And Verify error message "The Password field is required" displayed
    And Verify error message "The Retype Password field is required" displayed
    And Verify error message "The Company Type field is require" displayed
  #15

  Scenario Outline: User should able Sign In trough Account - My account
    And Verify user on "Home page" page
    Then Click on "Account" icon
     #Then Click "Sign In" link
    Then Click "My Account" link
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Verify user on "My Account" page
    And "My Account" should contains "<user_name>", "<email>", "<account_name>"
    Then My account page should include required sections
  #      | My Account Details      |
  #      | My Order History        |
  #      | My Loyalty Program      |
  #      | My Frequently Purchased |

    Examples:
      | email                 | password | user_name | account_name        |
      | t.d.etundra@gmail.com | 123456   | Tatsiana  | Tatsiana Darashenka |
    #17
  Scenario Outline: Add trending item to cart and verify checkout page match requirements
    Then Add Trending item from home page to cart
    Then Open cart
    Then Tap "Proceed to Checkout" button
    Then Enter email "<email>"
    And Enter password "<valid_password>"
    And Tap "Sign In" button
    Then Tap "Proceed to Checkout" button
    And Verify checkout page contain required sections
#      | Contact Information |
#      | Secure Billing      |
#      | Shipping Address    |
#      | Order Summary       |
#      | Shipping Options    |
#      | PO Number           |
#      | Coupon Code         |
    Then Verify Place your order buttons displayed
    And "What happens now" text should match requirements
 # Please ensure all information is correct before submitting. By clicking \"Place Your Order\" your order will be submitted and you will receive a confirmation message on the following page
    Examples:
      | email                 | valid_password  |
      | t.d.etundra@gmail.com |123456        |

  #18
  @checkout @tester
  Scenario Outline: Sign Out
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Enter email "<email>"
    And  Enter password "<valid_password>"
    And Tap "Sign In" button
    Then Click on "Account" icon
    Then Click "Sign Out" link
    And User should be logout
    Examples:
      | email                 | valid_password  |
      | t.d.etundra@gmail.com | 123456 |