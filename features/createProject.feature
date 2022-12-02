Feature: Create Project
  As coreteam user
  I want to create a project
  So that people can participate in it

@verifyProjectToBeCreatedWithAllFieldsDoesNotExistAlready
Scenario: coreteam creates project with only required fields successfully
    Given I have entered "coreteam@gmail.com" as email and my password
      And I press INICIAR SESIÓN
      And I click on Proyectos icon
    When I click CREAR PROYECTO
      And I enter the required fields as shown below
      |Fecha de Inicio: 	    | 02-12-2022            |
      |Fecha de Fin: 	    | 15-12-2022            |
      |Nombre del Proyecto: 	    | En Busca de Hogares            |
      |Objetivo: 	    | Encontrar hogar para perritos abandonados            |
      |Descripción: 	    | Buscamos hogares para perritos abandonados            | 
      |Lideres: 	    | Alvaro          |    
      |Categorias: 	    | Animales            |  
      |Estados: 	    | EN CURSO           |  
      |Información Adicional: 	    | Tenemos actualmente 10 perritos en busca de hogar            |  
      And I click CREAR PROYECTO button in the form
    Then I should see the list of project categories
      And validate the project exists in category "ANIMALES"
    @deleteCreatedProjectWithAllFields

@verifyProjectToBeCreatedDoesNotExistAlready
Scenario: coreteam creates project with only required fields successfully
    Given I have entered "coreteam@gmail.com" as email and my password
      And I press INICIAR SESIÓN
      And I click on Proyectos icon
    When I click CREAR PROYECTO
      And I enter the required fields as shown below
      |Nombre del Proyecto:: 	    | Reforestacion del Tunari            |
      |Descripción: 	    | Reforestar Cerro Tunari para mejorar medio ambiente             |
      And I click CREAR PROYECTO button in the form
    Then I should see the list of project categories
      And validate the project exists
    @deleteCreatedProject

@no_create
Scenario: volunteer and leader users cannot create project
    Given I have entered "<email>" as email and my password
    When I click on Proyectos icon
    Then I should not see the button CREAR PROYECTO
Examples:
    | email               |
    |  voluntario@gmail.com   |
    |  lider@gmail.com   |

## NOTE: This scenario is not proved to be working correctly
# @non-required-fields
# Scenario: coreteam fails to create project without fields: name and description
#    Given I have entered "coreteam@gmail.com" as email and my password
#      And I press INICIAR SESIÓN
#      And I click on Proyectos icon
#    When I click CREAR PROYECTO          
#      And I click CREAR PROYECTO button in the form
#    Then I should see the message "Error: Campo required" in both fields
