Feature: Checkout test

  Background:
    Given Open "https://www.etundra-test6.com" site
    Then Add Trending item from home page to cart
    Then Open cart
    Then Click Proceed to Checkout button

  @iframe
  Scenario Outline:Checkout
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Click Proceed to Checkout button
    And Press "ADD NEW" button
#    Then Enter "VISA" card number
    And Enter valid card month
#    And Enter valid year
#    Then Enter valid cardholder name
#    And Enter valid CVV
    Examples:
      | email                 | password |
      | t.d.etundra@gmail.com | Pa$$w0rd     |


