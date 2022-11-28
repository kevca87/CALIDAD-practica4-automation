Feature: Delete Project
  As coreteam user
  I want to delete a project
  So that people won't see it anymore

Scenario: coreteam deletes project successfully
    Given I have entered "coreteam@gmail.com" as email
      And I have entered "123456" as password
      And I go to Projects window
      And I click on "MEDIO AMBIENTE" category
      And I click Proyecto de Prueba ver detalles button
    When I click on ELIMINAR
        And I click on ELIMINAR
    Then I should see the Projects window

Scenario: volunteer and leader users cannot delete project
    Given I have entered "<email>" as email
      And I have entered "<password>" as password
      And I click on "MEDIO AMBIENTE" category
    When I click Proyecto de Prueba ver detalles button
    Then I should not see the button to delete a project
Examples:
    | email               | password    | 
    |  voluntario@gmail.com   |  123456 |
    |  lider@gmail.com   |  123456 |
