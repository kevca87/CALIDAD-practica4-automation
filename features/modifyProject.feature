Feature: Modify Project
  As coreteam user
  I want to modify a project
  So that I can update its information

Scenario: coreteam creates project successfully
    Given I have entered "coreteam@gmail.com" as email
      And I have entered "123456" as password
      And I go to Projects window
      And I click on "MEDIO AMBIENTE" category
    When I press the EDIT ICON of Proyecto de Prueba project
      And I change the project name to "Proyecto de prueba 1"
      And I click GUARDAR CAMBIOS
    Then I should see the Projects of "MEDIO AMBIENTE" category
      And I should see the proyect with title "Proyecto de prueba 1"

Scenario: volunteer and leader users cannot modify a project
    Given I have entered "<email>" as email
      And I have entered "<password>" as password
      And I go to Projects window
    When I click on "MEDIO AMBIENTE" category
    Then I should not see the edit icon on the project cards
Examples:
    | email               | password    | 
    |  voluntario@gmail.com   |  123456 |
    |  lider@gmail.com   |  123456 |
