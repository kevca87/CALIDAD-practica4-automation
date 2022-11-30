Feature: Register a user
  As a new volunteer user
  I want to register in the system
  In order to participate in projects and events

  @register 
  Scenario: Successful registration
    Given I type "Kevin" in "Nombre *" 
    And I type "Cespedes" in "Apellido *"
    And I type "kevcespedes358@gmail.com" in "Correo *"
    And I type "59167425216" in "Telefono"
    And I type "contra123" in "Contraseña *"
    And I type "contra123" in "Confirma tu contraseña *"
    When the button "CREA TU CUENTA DE START" is pressed
    Then an alert appears with the message "Se ha enviado un correo de confirmación al email: kevcespedes358@gmail.com"

  # Scenario: Passwords don't match
  #   Given the field "Nombre" filled with "Kevin"
  #   And the field "Apellido" filled with "Cespedes"
  #   And the field "Correo" filled with "kevcespedes3388@gmail.com"
  #   And the field "Telefono" filled with "67425216"
  #   And the field "Contraseña" filled with "contra123"
  #   When the field "Confirma tu contraseña" is filled with "contra555"
  #   Then an alert appears with the message "Las contraseñas no coinciden"