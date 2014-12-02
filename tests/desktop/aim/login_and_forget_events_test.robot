*** Settings ***
Library           Selenium2Library
Suite Setup		  Environment setup
Suite Teardown	  Teardown Browser
Resource          ../../../resources/login/login_resource.txt

*** Test Cases ***

Login Page Hot links Displayed
	[Tags]		LoginPageElements	Mobile
	Given I am a MyBlue Member on the Login Page

#US369 - Forgot Username
Login Page forgot username Hot links Displayed
	[Tags]		ForgotUsername	Mobile
	Sleep		${EVENT}
	When I click the "#forgotUsername" link
	Then I should be navigated to "${SERVER}/forgot/username"

I should not see the modal when I click cancel
	[Tags]		ForgotUsername	Mobile
	When I click the "div.cancel a" link
	Then I navigate to "${SERVER}/login"


#US1638 & US1610 - Forgot email
I should be navigated to the forgot email page
	[Tags]		ForgotEmailAddress
	Sleep		${EVENT}
    When I click the "#forgotEmailAddress" link
    Then I should be navigated to "${SERVER}/forgot/email-address"

I should see a cancel button
	[Tags]		ForgotEmailAddress
    Then I should see the element ".cancel" displayed

When I click cancel I should be taken to the login page
	[Tags]		ForgotEmailAddress
	When I click the ".cancel a" link
    Then I should be navigated to "${SERVER}/login"


#US1609 - Forgot Password
Login Page forgot password Hot links Displayed
	[Tags]		ForgotPassword	Mobile
	Sleep		${EVENT}
	When I click the "#forgotPassword" link
	Then I should be navigated to "${SERVER}/forgot/password"

I should see a cancel button
	[Tags]		ForgotPassword	Mobile
	Then I should see the element "div.cancel" displayed

I should be directed to login when I click cancel
	[Tags]		ForgotPassword	Mobile
	When I click the "div.cancel a" link
	Then I navigate to "${SERVER}/login"
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