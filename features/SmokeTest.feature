@test
Feature: Smoke test

  Background:
   Given Open "https://www.etundra-test6.com" site
  #  Given Open "https://www.etundra.com" site
  # Given Open "https://www.etundra-test2.com" site
#1 Smoke
  Scenario: Home Page - Categories menu verification
    Then Verify that menu contains categories:
      | Equipment          |
      | Parts              |
      | Plumbing           |
      | Kitchen            |
      | Dining Room        |
      | Disposables        |
      | Furniture          |
      | Specialty Supplies |
      | Clearance          |
      | Brands             |
      | More...            |
#2 Smoke
  @smoke @demo
  Scenario Outline: Filter categories verification - facet menu
    Then Click on category "<category_name>"
    And Verify that user located on "<pagetitle>" page
    Examples:
      | category_name      | pagetitle                                          |
      | Equipment          | Commercial Restaurant Equipment                    |
      | Parts              | Restaurant Equipment Parts & Hardware              |
      | Plumbing           | Commercial Plumbing Supplies                       |
      | Kitchen            | Kitchen Supplies                                   |
      | Dining Room        | Restaurant Dining Room Supplies                    |
      | Disposables        | Disposables                                        |
      | Furniture          | Restaurant Furniture                               |
      | Specialty Supplies | Specialty Shop Supplies                            |
      | Clearance          | Discount Restaurant Equipment and Kitchen Supplies |
##3
  @smoke
  Scenario Outline: Verify that each category from list below contains required facet filter category
    Then Click on category "<category_name>"
    And Verify facet menu contains facet subcategory
      | Specials       |
      | Sub Categories |
      | Brands         |
      | Pricing        |
    Examples:
      | category_name      |
      | Equipment          |
      | Parts              |
      | Plumbing           |
      | Kitchen            |
      | Dining Room        |
      | Disposables        |
      | Furniture          |
      | Specialty Supplies |
      | Clearance          |
 #4
  @smoke
  Scenario Outline: Verification of Stocked Item in Specials and quantity of items
    Then Click on category "<category_name>"
    Then Verify this category "Specials" includes "Quick Ship Plus" items
    And Verify "Quick Ship Plus" displays quantity of available items
    And When user move mouse to ? mark "Quick Ship Plus" pop over message displayed
    And Verify this category "Specials" includes "Stocked Item" items
    Then Verify "Stocked Item" displays quantity of available items
    Then When user move mouse to ? mark "Stocked Item" pop over message displayed
    Examples:
      | category_name |
      | Equipment     |
#      | Parts         |
      | Plumbing      |
      | Kitchen            |
#      | Dining Room        |
#      | Disposables        |
#      | Furniture          |
#      | Specialty Supplies |
#      | Clearance          |
##5
  @smoke
  Scenario Outline: Search by Product Name functionality
    Then Enter "<product_name>" to search field
    Then Press "Search" button
    And Verify the title of page display "<product_name>" page displays correct product name sections
    And Search result should display qty products found
    Then Message "Search was unable to find any results" should be displayed of no products found
    Examples:
      | product_name |
      | vitamix      |
#6
  @smoke
  Scenario Outline: Search by product name functionality - verify that some search redirect user to brand page
    Then Enter "<product_name>" to search field
    Then Press "Search" button
    And Verify that user on "<brandname>" page
    Examples:
      | product_name | brandname |
      | cambro       | cambro    |

#7
  @smoke
  Scenario Outline: Search by item number functionality
    Then Enter "<item_code>" to search field
    Then Press "Search" button
    And Verify item title contains "<item_code>"
    Examples:
      | item_code |
      | 990042400 |
      | RL35-0000 |
#      | 114251    |
#      | 5400      |
#      | WB-4      |

#8
  @smoke
  Scenario Outline: Search by SKU functionality
    Then Enter "<sku>" to search field
    Then Press "Enter" on keyboard
    And Verify page correct "<sku>" item page opens
    Examples:
      | sku     |
      | ISI1007 |
      | ISI1004 |
#      | 51309   |
#      | 56102   |
#9
  @smoke
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
#11
  @smoke @demo
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
      | t.d.etundra@gmail.com |Zxc123zxc | Tatsiana |

#12
  @smoke
  Scenario Outline: Forgot password functionality- combination of scenarios
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Tap "Forgot your password?" link
    And Verify user on "Forgot Password" page
    And  "Forgot Password" page should display title, correct messages, buttons and "<valid_email>" if required
    Then Press "Reset Password" button
    Then Verify error message "The Email Address field is required" displayed
    Then Enter "<invalid_email>" for resetting password
    Then Press "Reset Password" button
    And Verify user on "Forgot Password" page
    Then Enter "<valid_email>" for resetting password
    Then Press "Reset Password" button
    And Verify user on "Reset Password" page
    And "Reset Password" page should display title, correct messages, buttons and "<valid_email>" if required
    Examples:
      | valid_email           | invalid_email     |
      | t.d.etundra@gmail.com | invalid@gmail.com |
# 13
  @smoke @demo
  Scenario: User registration verification -User registration with valid random data
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Enter First Name
    Then Enter Last Name
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
  @smoke @demo
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
  @smoke @demo
  Scenario Outline: User should able Sign In trough Account - My account
    And Verify user on "Home page" page
    Then Click on "Account" icon
   #Then Click "Sign In" link
    Then Click My Account link
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
      | email                 | password  | user_name | account_name        |
      | t.d.etundra@gmail.com | Zxc123zxc | Tatsiana  | Tatsiana Darashenka |
   #16
  Scenario Outline: Left menu categoru verivication
    Then Move mouse to the header "<category_name>"
    And Verify "<category_name>" pop-window displays subcategories and brands links
    Then Click on category "<category_name>"
    And Verify left panel "Sub Categories" contains sub-categories
    Then Click random "Subcategory" from left panel
    #Then Verify page displays items and items have prices, SKU and images
    Examples:
      | category_name |
      | Equipment     |
#      | Parts         |
#      | Plumbing      |
#      | Kitchen       |
#      | Dining Room   |
#      | Disposables   |
#      | Furniture     |
#17
  Scenario Outline: Add trending item to cart and verify checkout page match requirements
    Then Add Trending item from home page to cart
    Then Open cart
    Then Click Proceed to Checkout button
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Click Proceed to Checkout button
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
  | email                 | password  |
  | t.d.etundra@gmail.com | Zxc123zxc |

  #18
  @checkout @tester
  Scenario Outline: Sign Out
    Then Click on "Account" icon
    Then Click "Sign In" link
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Click on "Account" icon
    Then Click "Sign Out" link
    And User should be logout
    Examples:
      | email                 | password  |
      | t.d.etundra@gmail.com | Zxc123zxc |

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
      | t.d.etundra10@gmail.com | 1234      |

#20 @wip
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

  Scenario Outline:Checkout
    Then Add Trending item from home page to cart
    Then Open cart
    Then Click Proceed to Checkout button
    Then Enter email "<email>"
    And Enter valid password "<password>"
    And Tap "Sign In" button
    Then Click Proceed to Checkout button
    Examples:
      | email                   | password    |
      | t.d.etundra@gmail.com   | 123456      |










