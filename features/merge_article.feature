Feature: Merge Articles
  As a blog administrator
  In order to avoid mutilple articles with same title
  I want to be able to merge articles 

  Background: 
     Given the blog is set up
     And the following articles exist:
      | title      | body           | author  |     
      | spring A   | spring story A | admin   |
      | spring B   | spring story B | lucky   |
    And I am logged into the admin panel

  Scenario: When articles are merged, the merged article should contain the text of both previous articles 
    Given I am on the edit page for article "spring B"
    When I fill in the id of merged article "spring A"
    And I press "Merge"
    Then I am on the index article page
    And I should see 2 articles with title "spring B"
    And I should see 4 articles
    Then the newest article "spring B" should have body "spring story B. spring story A"

     
