Feature: Join a project
  As a volunteer/coreteam/leader
  I want to join a project
  So that I can be part of it

Scenario: Join a project
    Given I have entered "<email>" as email and my password      
      And I press INICIAR SESIÓN      
      And I am not part of the project "Purificación de Aire en Cercado"
      And I click on Proyectos icon
      And I click on "MEDIO AMBIENTE" category
      And I click on the project "Purificación de Aire en Cercado" ver detalles button
    When I click UNIRME
    Then I should see the message "Participacion exitosa"
    Examples:
   | email |
   | voluntario@gmail.com |
   | lider@gmail.com |
   | coreteam@gmail.com |