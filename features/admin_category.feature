Feature: admin Category
  As a blog administrator
  In order to classify articles with different Category
  I want to be able to CRUD it

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: create a new category
    When I follow "Categories"
    Then I should be on the new Category page
    And I fill in "category_name" with "workmate"
    And I fill in "category_keywords" with "mate"
    And I fill in "category_description" with "Blog article about the colledge classmate"
    And I press "Save"
    Then I should be on the new Category page
    And I should see "workmate"
    When I follow "workmate"
    Then I should see "Blog article about the colledge classmate"

