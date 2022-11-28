Feature: LOGIN
  As a leader, volunteer, teamcore
  I want to enter the system
  So that I can interact with the system 

Scenario: Successful login
    Given I have entered "<email>" as email
    And I have entered "<password>" as password
    When I press login
    Then I should view the Home Page

    Examples:
   | email | password |
   | voluntario@gmail.com | 123456 |
   | lider@gmail.com | 123456 |
   | coreteam@gmail.com | 123456 |


Scenario: Invalid password for valid user
    Given I have entered "<email>" as email
    And I have entered "<password>" as password
    Then I should view an error message

    Examples:
   | email | password |
   | voluntario@gmail.com | 1234566 |
   | lider@gmail.com | 12346 |
   | coreteam@gmail.com | asdfasd |

