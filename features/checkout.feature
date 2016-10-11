Feature: Checkout test

  Background:
    Given Open "https://www.etundra-test6.com" site
    Then Add Trending item from home page to cart
    Then Open cart
    Then Click Proceed to Checkout button


#19
  Scenario Outline:Checkout
    Then Add Trending item from home page to cart
    Then Open cart
    Then Click Proceed to Checkout button
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Click Proceed to Checkout button
    And Press "ADD NEW" button
#    Then Enter "VISA" card number card month, year, cardholder name and cvv
    Examples:
      | email                   | password  |
      | t.d.etundra10@gmail.com | 12334      |

