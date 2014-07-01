Feature: non-admin cannot merge articles
  As an author
  In order to adminitrator aritcles more save
  I cannot merge the article

  Background:
    Given the blog is set up
    And the following articles exist:
      | title      | body           | author  |     
      | spring A   | spring story A | admin   |
      | spring B   | spring story B | lucky   |
    And the following users exist:
      | login      |  password |  email             | profile    | name |
      | lucky      |  aaaaaaaa |  lucky888@21cn.com | publisher	 | lucky|
    And I am logged into the lucky panel

  Scenario: A non-admin cannot merge two articles 
    Given I am on the edit page for article "spring B"
    Then show me the page
    And I should not see "Merge Articles"
