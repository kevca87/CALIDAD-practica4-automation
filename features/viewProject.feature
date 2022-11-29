Feature: View Project Details
  As a volunteer/coreteam/leader
  I want to view project details
  So that I can get more information about a specific project

Scenario: View project details
    Given I have entered "<email>" as email and my password
      And I click INICIAR SESIÓN
      And I click on Proyectos icon
      And I click on "MEDIO AMBIENTE" category
    When I click on the project "Nombre Proyecto Ambiental" ver detalles button
    Then I should see "Nombre Proyecto Ambiental" as title of the project
      And the following information should be displayed:
        | Fecha de Inicio: |  2022-11-29  |
 	      | Fecha de Fin:    |   En Progreso    | 
        | Descripción:     |   descripción Nombre Proyecto Ambiental   | 
        | Objetivo:        |   | 
        | Líder:           |   KEVIN DIEGO   | 
        | Categoría:       |   Medio Ambiente    | 

    Examples:
   | email |
   | voluntario@gmail.com |
   | lider@gmail.com |
   | coreteam@gmail.com |