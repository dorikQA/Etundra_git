@homepage

Feature: Home page

  Background:
    Given Open "https://www.etundra.com" site
#1-4
#1
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
#2

  Scenario Outline:  Filter categories verification - facet menu

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
#3
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

  Scenario Outline: Verification of Stocked Item in Specials and quantity of items
    Then Click on category "<category_name>"
    Then Verify this category "Specials" includes "Quick Ship Plus" items
    And Verify "Quick Ship Plus" displays quantity of available items
    And When user move mouse to ? mark "Quick Ship Plus" pop over message displayed
    And Verify this category "Specials" includes "Stocked Item" items
    Then Verify "Stocked Item" displays quantity of available items
    Then When user move mouse to ? mark "Stocked Item" pop over message displayed
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

#  Scenario: Page title verification - User should see correct page title for each category
#
#    When Click on category "Parts"
#
#    Then ser located on "Restaurant Equipment Parts & Hardware"
#
#    Then Verify when user clicks on category "Equipment" he should  "Commercial Restaurant Equipment" page
#    When When user click on category "Plumbing" user located on "Commercial Plumbing Supplies
#    When When user click on category "Kitchen" user located on "Kitchen Supplies"
#    When When user click on category "Dining Room" user located on "Restaurant Dining Room Supplies"
#    When When user click on category "Furniture" user located on "Restaurant Furniture"
#    When When user click on category "Specialty Supplies" user located on "Specialty Shop Supplies"
#    When When user click on category "Specialty Supplies" user located on "Specialty Shop Supplies"
#
