Feature: Leave a previously joined project
  As a volunteer/coreteam/leader
  I want to leave a project I was previously joined to
  So that other participants can see that I am not going to be part anymore

Scenario: Leave a project I was previoulsy joined to
    Given I have entered "<email>" as email and my password
      And I click INICIAR SESIÓN
      And I click on Proyectos icon
      And I click on "MEDIO AMBIENTE" category
      And I click on the project "Nombre Proyecto Ambiental" ver detalles button
    When I click DEJAR PROYECTO
    Then I should see the message "Participacion cancelada"
      And I should see the button "DEJAR PROYECTO" replaced by buttton "UNIRME"
      
    Examples:
   | email |
   | voluntario@gmail.com |
   | lider@gmail.com |
   | coreteam@gmail.com |