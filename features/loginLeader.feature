Feature: Leader LOGIN
  As a leader
  I want to enter the system
  So that I can interact with the system 

Scenario: Successful login
    Given I have entered "lider@gmail.com" as email
    And I have entered "123456" as password
    When I press "login"
    Then I should view the Home Page

Scenario: Invalid password for valid leader user
    Given I have entered "lider@gmail.com"as email
    And I have entered "123455" as password
    Then I should view an error message

