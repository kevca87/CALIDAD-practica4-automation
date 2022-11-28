Feature: Show the projects which I joined in my account
 In order to Watch which projects I joined
 As a volunteer
 I want to whatch which projects I joined accessing to my account

@view_project
Scenario: View the projects
    Given a volunteer logged 
    And in the account view
    And the volunteer has one or many projects joined
    When i click in the "TUS PROYECTOS" tab
    Then i should be able to watch a list of the diferent projects

@view_no_event
Scenario: View no projects
    Given a volunteer logged
    And in the account view
    And the volunteer has not projects joined
    When i click in the "TUS PROYECTOS" tab
    Then i should see the message "Aún no te has registrado a ningún proyecto. Una vez te hayas registrado a alguno de nuestros proyectos, aparecerán en tu página de inicio."
    And i should see a button "EXPLORAR PROYECTOS"