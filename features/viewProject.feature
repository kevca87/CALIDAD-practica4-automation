Feature: View Project Details
  As a volunteer/coreteam/leader
  I want to view project details
  So that I can get more information about a specific project

@verifyProjectExists
Scenario: View project details
    Given I have entered "<email>" as email and my password
      And I press INICIAR SESIÓN
      And I click on Proyectos icon
      And I click on "MEDIO AMBIENTE" category
    When I click on the project "Purificación de Aire en Cercado" ver detalles button
    Then I should see "Purificación de Aire en Cercado" as title of the project
      And the following information should be displayed:
        | Fecha de Inicio: |  2022-12-02  |
 	      | Fecha de Fin:    |   En Progreso    | 
        | Descripción:     |   se realizará una campaña sobre purificación de aire   | 
        | Objetivo:        |   | 
        | Líder:           |   KEVIN DIEGO   | 
        | Categoría:       |   Medio Ambiente    | 

    Examples:
   | email |
   | voluntario@gmail.com |
   | lider@gmail.com |
   | coreteam@gmail.com |