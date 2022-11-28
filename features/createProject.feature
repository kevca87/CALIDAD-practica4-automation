Feature: Create Project
  As coreteam user
  I want to create a project
  So that people can join it and help with it

Scenario: coreteam creates project successfully
    Given I have entered "coreteam@gmail.com" as email
      And I have entered "123456" as password
      And I go to Projects window
      And I press CREAR PROYECTO
    When I enter the required fields as shown below
      |Project name: 	    | proyecto de prueba             |
      |Description: 	    | descripción de proyecto              |
      And I click CREAR PROYECTO
    Then I should see the Projects window

Scenario: volunteer and leader users cannot create project
    Given I have entered "<email>" as email
      And I have entered "<password>" as password
    When I go to Projects window
    Then I should not see the button to create a project
Examples:
    | email               | password    | 
    |  voluntario@gmail.com   |  123456 |
    |  lider@gmail.com   |  123456 |
