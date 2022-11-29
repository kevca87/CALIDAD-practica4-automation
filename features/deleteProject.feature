Feature: Delete Project
  As coreteam user
  I want to delete a project
  So that people won't see it anymore

Scenario: coreteam deletes project successfully
    Given I have entered "coreteam@gmail.com" as email and my password
      And I click INICIAR SESIÓN
      And I click on Proyectos icon
      And I click on the project "Nombre Proyecto Ambiental" ver detalles button
    When I click on ELIMINAR
        And I click on ELIMINAR confirmation message
    Then I should see validate the project is deleted

Scenario: volunteer and leader users cannot delete project
    Given I have entered "<email>" as email and my password
      And I click INICIAR SESIÓN      
    When I click on the project "Nombre Proyecto Ambiental" ver detalles button
    Then I should not see the button ELIMINAR
Examples:
    | email               | 
    |  voluntario@gmail.com   |
    |  lider@gmail.com   | 
