@track_order
Feature: Track order functionality

  Background:
    Given Open "https://www.etundra.com" site

#20
  Scenario: Tracking order - Valid order number and valid postal code
    Then Click on "Track Order" icon
    And Enter valid Order number
    And Enter valid Postal code
    Then Tap "Go" button
    And Verify user relocated to "Order Details" page
    And Verify message "Web Reference Number" displayed
    And Verify message "Invoice Number" displayed
    And Verify message "Order Date" displayed
#21
  Scenario: Tracking order - Empty order number and valid postal code
    Then Click on "Track Order" icon
     # And Enter empty Order number
    And Enter valid Postal code
    Then Tap "Go" button
    And Verify user relocated to "Track Order" page
    And Verify message "Please provide an order number" displayed
#22
  Scenario: Tracking order - invalid order number and valid postal code
    Then Click on "Track Order" icon
    And Enter invalid Order number
    And Enter valid Postal code
    Then Tap "Go" button
    And Verify user relocated to "Track Order" page
    And Verify message "Cannot find order. Please, try again" displayed
    And Verify message "Please enter Order or Web Reference # and Destination Postal Code." displayed
#23
  Scenario: Tracking order - Valid order number and empty postal code
    Then Click on "Track Order" icon
    And Enter valid Order number
    # And Enter empty Postal code
    Then Tap "Go" button
    And Verify user relocated to "Track Order" page
    And Verify message "Please provide a destination postal code" displayed
    And Verify message "Please enter Order or Web Reference # and Destination Postal Code." displayed
#24
  Scenario: Tracking order - Empty order number and empty postal code
    Then Click on "Track Order" icon
  #   And Enter empty Order number
  #   And Enter empty Postal code
    Then Tap "Go" button
    And Verify user relocated to "Track Order" page
    And Verify message "Please provide all information" displayed
    And Verify message "Please enter Order or Web Reference # and Destination Postal Code." displayed
#25
  Scenario Outline: wip
    Then Add Trending item from home page to cart
    Then Open cart
    Then Tap "Proceed to Checkout" button
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Tap "Proceed to Checkout" button
    Then Tap "PLACE YOUR ORDER" button
    Then Verify message "Order Confirmation" displayed
    Then Verify message "Thank you for placing your order" displayed
    Then Verify message "Your web reference number for this order is" displayed
    Examples:
      | email                 | password |
      | t.d.etundra@gmail.com | 123456   |
