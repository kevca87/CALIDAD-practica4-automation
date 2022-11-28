Feature: Leave a previously joined project
  As a volunteer/coreteam/leader
  I want to join a project
  So that I can be part of it

Scenario: Join a project
    Given I have entered "<email>" as email
      And I have entered "<password>" as password
      And I press login
      And I go to Projects window
      And I click on "MEDIO AMBIENTE" category
      And I press Proyecto de Prueba ver detalles button
    When I press UNIRME
    Then I should see the message "Participacion exitosa"
      And I should see the button UNIRME replaced by DEJAR PROYECTO
      
    Examples:
   | email | password |
   | voluntario@gmail.com | 123456 |
   | lider@gmail.com | 123456 |
   | coreteam@gmail.com | 123456 |