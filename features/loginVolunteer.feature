Feature: Volunteer LOGIN
  As a volunteer
  I want to enter the system
  So that I can interact with the system 

Scenario: Successful login
    Given I have entered "voluntario@gmail.com" as email
      And I have entered "123456" as password
    When I press login
    Then I should see the Start Americas Together image
      And I should see tab icons
      And I should see my name

@failLogin
Scenario: Invalid password for valid volunteer user
    Given I have entered "voluntario@gmail.com" as email
      And I have entered "123455" as password
    When I press login
    Then I should view an error message

