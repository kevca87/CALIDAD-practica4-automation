Feature: Register a user
  As a new volunteer user
  I want to register in the system
  In order to participate in projects and events
 
  Scenario: Successful registration
    Given the field "Nombre" filled with "Kevin"
    And the field "Apellido" filled with "Céspedes"
    And the field "Correo" filled with "kevcespedes95@gmail.com"
    And the field "Telefono" filled with "67425216"
    And the field "Contraseña" filled with "contra123"
    And the field "Confirma tu contraseña" filled with "contra123"
    When the button "CREA TU CUENTA DE START" is pressed
    Then an alert appears with the message "Se ha enviado un correo de confirmación al email: kevcespedes95@gmail.com"

  Scenario: Passwords don't match
    Given the field "Nombre" filled with "Kevin"
    And the field "Apellido" filled with "Céspedes"
    And the field "Correo" filled with "kevcespedes95@gmail.com"
    And the field "Telefono" filled with "67425216"
    And the field "Contraseña" filled with "contra123"
    When the field "Confirma tu contraseña" is filled with "contra555"
    Then an alert appears with the message "Las contraseñas no coinciden"