*** Settings ***
Suite Setup       Environment setup
Suite Teardown    Teardown Browser
Library           Selenium2Library
Resource          ../../../resources/pilot/login/login_resource.robot

*** Test Cases ***
Login Pilot login page forgot username event logged
    [Tags]    LoginPageElements    Mobile    AIM1
    Given I am a MyBlue Member on the Login Page
    When I click "username" link tracked for event "authentication:forgotusername"
    Then I should see event for "authentication:forgotusername" logged in Google Analytics

Pilot login page forgot email event logged
    [Tags]    ForgotEmailAddress    AIM1
    Given I am a MyBlue Member on the Login Page
    When I click "e-mail address" link tracked for event "authentication:forgotemail"
    Then I should see event for "authentication:forgotemail" logged in Google Analytics

Pilot login page forgot password event logged
    [Tags]    ForgotPassword    AIM1
    Given I am a MyBlue Member on the Login Page
    When I click "password" link tracked for event "authentication:forgotpassword"
    Then I should see event for "authentication:forgotpassword" logged in Google Analytics
    Teardown Browser

Pilot login page success event logged
    [Tags]    ValidLoginTest    Mobile    AIM1
    Given I am a MyBlue Member on the Login Page
    And I Enter A Username "#LoginUsername" "marchcontractuat"
    And I Enter A Password "#LoginPassword" "Bigfun21!"
    When I click "#login" tracked for event "authentication:login_success:Successful Login"
    Then I should see event for "authentication:login_success:Successful Login" logged in Google Analytics
    Teardown Browser

Pilot login page failure event logged
    [Tags]    InvalidLoginTest    Mobile    AIM1
    Given I am a MyBlue Member on the Login Page
    And I Enter A Username "#LoginUsername" "nomarchcontractuat"
    And I Enter A Password "#LoginPassword" "nofun"
    When I click "#login" tracked for event "authentication:login_failure:User Credentials Invalid"
    Then I should see event for "authentication:login_success:Successful Login" logged in Google Analytics
    Teardown Browser
