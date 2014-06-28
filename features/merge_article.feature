Feature: Merge Articles
  As a blog administrator
  In order to avoid mutilple articles with same title
  I want to be able to merge articles 

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
      | id  | title   	 | body           |     
      | 2   | spring A   | spring story A |
      | 3   | spring B   | spring story B |

  Scenario: Successfully merge articles when edit article
    Given I am on the edit page for article "spring B"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then the article "spring B" should have body "spring story B.spring story A"
    And show me the page

