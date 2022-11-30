Feature: Join a project
  As a volunteer/coreteam/leader
  I want to join a project
  So that I can be part of it

Scenario: Join a project
    Given I have entered "<email>" as email and my password
      And I press INICIAR SESIÓN
      And I click on Proyectos icon
      And I click on "MEDIO AMBIENTE" category
      And I click on the project "Nombre Proyecto Ambiental" ver detalles button
    When I click UNIRME
    Then I should see the message "Participacion exitosa"
      And I should see the button UNIRME replaced by "DEJAR PROYECTO"
    Examples:
   | email |
   | voluntario@gmail.com |
   | lider@gmail.com |
   | coreteam@gmail.com |