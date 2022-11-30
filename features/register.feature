@register
Feature: Register a user
  As a new volunteer user
  I want to register in the system
  In order to participate in projects and events

  Scenario: Successful registration
    Given I type "Kevin" in "Nombre *" 
    And I type "Cespedes" in "Apellido *"
    And I type "kevcespedes7389@gmail.com" in "Correo *"
    And I type "59167425216" in "Telefono"
    And I type "contra123" in "Contraseña *"
    And I type "contra123" in "Confirma tu contraseña *"
    When the button "CREA TU CUENTA DE START" is pressed
    Then an alert appears with the message "Se ha enviado un correo de confirmación al email: kevcespedes7389@gmail.com"
    # And I can login with user "kevcespedes4@gmail.com" and password "contra123" and see my initials "KC" in the top right corner.

  Scenario: Passwords don't match
    Given I type "Kevin" in "Nombre *" 
    And I type "Cespedes" in "Apellido *"
    And I type "kevcespedes358@gmail.com" in "Correo *"
    And I type "59167425216" in "Telefono"
    And I type "contra123" in "Contraseña *"
    And I type "contra187" in "Confirma tu contraseña *"
    When I click outside of the input field
    Then an alert appears with the message "Las contraseñas no coinciden"