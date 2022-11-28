Feature: View Project Details
  As a volunteer/coreteam/leader
  I want to view project details
  So that I can get more information about an specific project

Scenario: View project details
    Given I have entered "<email>" as email
      And I have entered "<password>" as password
      And I press login
      And I go to Projects window
      And I click on "MEDIO AMBIENTE" category
    When I press Proyecto de Prueba ver detalles button
    Then I should see the title of the project
      And I should see the start date of the project
      And I should see the end date of the project
      And I should see the project objective
      And I should see the project leader
      And I should see the project category
      
    Examples:
   | email | password |
   | voluntario@gmail.com | 123456 |
   | lider@gmail.com | 123456 |
   | coreteam@gmail.com | 123456 |