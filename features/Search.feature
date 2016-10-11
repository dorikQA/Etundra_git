@search
Feature: Track order feature functionality

  Background:
    Given Open "https://www.etundra.com" site
#5-8

#5
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

  Scenario Outline: Search by product name functionality - verify that some search redirect user to brand page
    Then Enter "<product_name>" to search field
    Then Press "Search" button
    And Verify that user on "<brandname>" page
    Examples:
      | product_name | brandname |
      | cambro       | cambro    |

#7

  Scenario Outline: Search by item number functionality
    Then Enter "<item_code>" to search field
    Then Press "Search" button
    And Verify item title contains "<item_code>"
    Examples:
      | item_code |
      | 990042400 |
      | RL35-0000 |
      | 114251    |
      | 5400      |
      | WB-4      |

#8
  Scenario Outline: Search by SKU functionality
    Then Enter "<sku>" to search field
    Then Press "Enter" on keyboard
    And Verify page correct "<sku>" item page opens
    Examples:
      | sku     |
      | ISI1007 |
      | ISI1004 |
      | 51309   |
      | 56102   |