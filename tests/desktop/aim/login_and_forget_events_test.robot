*** Settings ***
Library           Selenium2Library
Suite Setup		  Environment setup
Suite Teardown	  Teardown Browser
Resource          ../../../resources/login/login_resource.txt

*** Test Cases ***

Login Pilot login page forgot username event logged
    [Tags]      LoginPageElements   Mobile    AIM1
    Given I am a MyBlue Member on the Login Page
	Sleep		${EVENT}
	When I click "#forgotusername" tracked for event "authentication:forgotusername"
	Then I should see event for "authentication:forgotusername" logged

I should see no event when cancelling forgot username
	[Tags]		ForgotUsername	Mobile    AIM1
	When I click the "img[alt=Cancel]" link
    Then I should not see event for "authentication:forgotusername" logged


#US1638 & US1610 - Forgot email
Pilot login page forgot email event logged
	[Tags]		ForgotEmailAddress    AIM1
	Sleep		${EVENT}
    When I click the "#forgotemail" tracked for event "authentication:forgotemail"
    Then I should not see event for "authentication:forgotemail" logged

I should see no event when cancelling forgot email
	[Tags]		ForgotEmailAddress    AIM1
    When I click the "img[alt=Cancel]" link
    Then I should not see event for "authentication:forgotemail" logged


#US1609 - Forgot Password
Pilot login page forgot password event logged
    [Tags]      ForgotPassword    AIM1
    Sleep       ${EVENT}
    When I click the "#forgotpassword" tracked for event "authentication:forgotpassword"
    Then I should not see event for "authentication:forgotpassword" logged

I should see no event when cancelling forgot email
    [Tags]      ForgotPassword    AIM1
    When I click the "img[alt=Cancel]" link
    Then I should not see event for "authentication:forgotpassword" logged
	Teardown Browser


Valid Login
	[Tags]		ValidLoginTest	Mobile
    Given I am a MyBlue Member on the Login Page
    When I Enter A Username "#LoginUsername" "marchcontractuat"
    And I Enter A Password "#LoginPassword" "Bigfun21!"
    And I Click the "#login" Button
    Sleep				${NAVIGATION}
    Then I Am Navigated to Landing Page "div.myblue-header-content"
    Teardown Browser


Invalid Login With Invalid Password
	[Tags]		InvalidLoginTest	Mobile
    Given I am a MyBlue Member on the Login Page
    When I Enter A Username "#LoginUsername" "marchcontractuat"
    And I Enter A Password "#LoginPassword" "testPassword"
    And I Click the "#login" Button
    Sleep				${NAVIGATION}
    Then I Am Not Navigated to Landing Page "header[ng-show=\"page.header.visible\"]"
    And I should see the element "#errorMsg" displayed


Invalid Login With Invalid Username
	[Tags]		InvalidLoginTest	Mobile
    When I Enter A Username "#LoginUsername" "testUserName"
    And I Enter A Password "#LoginPassword" "marchcontractuat"
    And I Click the "#login" Button
    Sleep				${NAVIGATION}
    Then I Am Not Navigated to Landing Page "header[ng-show=\"page.header.visible\"]"
    And I should see the element "#errorMsg" displayed

I should see the loading popup when I click submit to login
	[Tags]		Loading		Mobile
    When I Enter A Username "#LoginUsername" "marchcontractuat"
    And I Enter A Password "#LoginPassword" "Bigfun21!"
    And I Click the "#login" Button
    I should see the loading popup visible
    Teardown Browser