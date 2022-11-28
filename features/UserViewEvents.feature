Feature: Show the events which I joined in my account
 In order to Watch which events I joined
 As a volunteer
 I want to whatch which events I joined accessing to my account

@view_events
Scenario: View the events
    Given a volunteer logged 
    And in the account view
    And the volunteer has one or many events joined
    When i click in the "TUS EVENTOS" tab
    Then i should be able to watch a list of the diferent events which i joined

@view_no_event
Scenario: View no events
    Given a volunteer logged
    And in the account view
    And the volunteer has not events joined
    When i click in the "TUS EVENTOS" tab
    Then i should see the message "Aún no te has registrado a ningún evento. Una vez te hayas registrado a alguno de nuestros eventos, aparecerán en tu página de inicio."
    And i should see a button "EXPLORAR EVENTOS"