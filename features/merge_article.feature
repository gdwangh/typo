Feature: Merge Articles
  As a blog administrator
  In order to avoid mutilple articles with same title
  I want to be able to merge articles 

  Background:
    Given the blog is set up
    And the following articles exist:
      | id  | title   	 | body           | author  |     
      | 2   | spring A   | spring story A | admin   |
      | 3   | spring B   | spring story B | lucky   |
    And the following users exist:
      | id  | login      |  password |  email             | profile 		|
      | 3   | lucky      |  aaaaaaaa |	lucky888@21cn.com | Blog publisher	|

  Scenario: When articles are merged, the merged article should contain the text of both previous articles 
    When I am logged into the admin panel
    And I am on the edit page for article "spring B"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then show me the page
    And the article "spring B" contain body of "3" with "2"


  Scenario: A non-admin cannot merge two articles 
    When I am logged into the lucky panel
    And I am on the edit page for article "spring B"
    Then I should not see "Merge Articles"
     
