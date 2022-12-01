Feature: Delete Project
  As coreteam user
  I want to delete a project
  So that people won't see it anymore

@verifyProjectToDeleteExists
Scenario: coreteam deletes project successfully
    Given I have entered "coreteam@gmail.com" as email and my password
      And I press INICIAR SESIÓN
      And I click on Proyectos icon
      And I click on "MEDIO AMBIENTE" category
      And I click on the project "Nombre Proyecto Ambiental para borrar" ver detalles button
    When I click on ELIMINAR
        And I click on ELIMINAR confirmation message
    Then I should see validate the project is deleted
@createDeletedProject

@verifyProjectToDeleteExists
Scenario: volunteer and leader users cannot delete project
    Given I have entered "<email>" as email and my password
      And I press INICIAR SESIÓN      
      And I click on Proyectos icon
      And I click on "MEDIO AMBIENTE" category
    When I click on the project "Limpiando el Río Rocha" ver detalles button
    Then I should not see the button ELIMINAR
    @createDeletedProject
Examples:
    | email               | 
    |  voluntario@gmail.com   |
    |  lider@gmail.com   | 
