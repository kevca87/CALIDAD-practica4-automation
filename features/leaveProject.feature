Feature: Leave a previously joined project
  As a volunteer/coreteam/leader
  I want to leave a project I was previously joined
  So that other participants can see that I am not going to be part anymore

Scenario: View project details
    Given I have entered "<email>" as email
      And I have entered "<password>" as password
      And I press login
      And I go to Projects window
      And I click on "MEDIO AMBIENTE" category
      And I press Proyecto de Prueba ver detalles button
    When I press DEJAR PROYECTO
    Then I should see the message "Participacion cancelada"
      And I should see the button DEJAR PROYECTO replaced by UNIRME
      
    Examples:
   | email | password |
   | voluntario@gmail.com | 123456 |
   | lider@gmail.com | 123456 |
   | coreteam@gmail.com | 123456 |