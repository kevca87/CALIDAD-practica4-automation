Feature: Edit the data of my accounts
 In order to edit the data if some of it changed or was mistaken
 As any user registered on the page
 I want to be able to edit the data of my account

@edit_birthday
Scenario: Change my birthday
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "25/04/2000" in the "fecha_de_nacimiento" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new date "25/04/2000" in my profile

@edit_birthday_bad
Scenario: Change my birthday to a bad date format
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "24/14/2000" in the "fecha_de_nacimiento" input
    Then i should be able to see the new ocupation "24/12/2000" in my profile 

@edit_ocupation
Scenario: Change if im a Student, academic or working
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i choose the "Trabajando" option in the "ocupacion" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new ocupation "Trabajando" in my profile

@edit_profession
Scenario: Change my profession
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "Gerente Administrativo" in the "carrera" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new profession "Gerente Administrativo" in my profile

@edit_city
Scenario: Change my city
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "Santa Cruz" in the "ciudad_de_residencia" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new city "Santa Cruz" in my profile

@edit_city
Scenario: Change my country
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "Chile" in the "pais_de_recidencia" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new country "Chile" in my profile

@edit_gender
Scenario: Change my gender
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i choose the "Prefiero no decirlo" option in the "genero" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new gender "Prefiero no decirlo" in my profile

@edit_name_emegency_contact
Scenario: Change the name of my emergency contact
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "Cristiano" in the "nombre_contacto_de_emergencia" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new name of my emergency contact "Cristiano" in my profile

@edit_relation_emegency_contact
Scenario: Change the relation of my emergency contact
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "Padre" in the "relacion_contacto_de_emergencia" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new relation of my emergency contact "Padre" in my profile

@edit_telephone_emegency_contact
Scenario: Change the telephone of my emergency contact
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "79033472" in the "numero_contacto_de_emergencia" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new telephone of my emergency contact "79033472" in my profile

@edit_description
Scenario: Change my description
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i type "Hola soy nuevo en esta pagina" in the "descripcion_personal" input
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see the new telephone of my emergency contact "Hola soy nuevo en esta pagina" in my profile

@edit_interest
Scenario: Change my interest
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i click the "Medio Ambiente" checkbox
    And i click the "Educacion" checkbox
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see my new interest as "Medio Ambiente" and "Educacion" in my profile

@edit_qualities
Scenario: Change my qualities
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i click the "Liderazgo" checkbox
    And i click the "Organizacion" checkbox
    And i click the "Aprendizaje Rapido" checkbox
    And i click the "Trabajo en equipo" checkbox
    And i click the "Creatividad" checkbox
    And i click the "Paciencia" checkbox
    And click the "GUARDAR CAMBIOS" button
    Then i should be able to see my new interest as "Liderazgo" and "Organizacion" and "Aprendizaje Rapido" and "Trabajo en equipo" and "Creatividad" and "Paciencia" in my profile

@edit_aptitudes
Scenario: Change my qualities
    Given a user registered in the application 
    And in the account view
    And in the editing account form
    When i uncheck all the checkboxes
    Then i should be able to see no aptitude in my profile