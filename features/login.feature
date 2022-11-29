Feature: LOGIN
  As a volunteer/leader/coreteam
  I want to enter the system
  So that I can view and manage projects and events

Scenario: Successful login
    Given I have entered "<email>" as email and my password
    When I press INICIAR SESIÓN
    Then I should see the tab icons
      And I should see the user name "<userName>"
  Examples:
   | email | userName |
   | voluntario@gmail.com | VV |
   | lider@gmail.com | LL |
   | coreteam@gmail.com | CT |

@invalidPassword
Scenario: Invalid password for valid user
    Given I have entered "<email>" as email and an invalid password
    When I press INICIAR SESIÓN
    Then I should view the message "Correo o contraseña inválidos."

Examples:
   | email |
   | voluntario@gmail.com |
   | lider@gmail.com |
   | coreteam@gmail.com |

