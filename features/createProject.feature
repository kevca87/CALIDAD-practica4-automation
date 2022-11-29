Feature: Create Project
  As coreteam user
  I want to create a project
  So that people can participate in it

Scenario: coreteam creates project successfully
    Given I have entered "coreteam@gmail.com" as email and my password
      And I click on Proyectos icon
    When I click CREAR PROYECTO
      And I enter the required fields as shown below
      |Project name: 	    | es el proyecto para probar            |
      |Description: 	    | descripción de proyecto para probar             |
      And I click CREAR PROYECTO
    Then I should see the list of project categories
      And validate the project exists

Scenario: volunteer and leader users cannot create project
    Given I have entered "<email>" as email and my password
    When I click on Proyectos icon
    Then I should not see the button CREAR PROYECTO
Examples:
    | email               |
    |  voluntario@gmail.com   |
    |  lider@gmail.com   |