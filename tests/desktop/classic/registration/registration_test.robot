*** Settings ***
Library           Selenium2Library
Suite Setup		  Environment setup
Suite Teardown	  Teardown Browser
Resource          ../../../resources/login/login_resource.txt

*** Test Cases ***

Login Page
	[Tags]		LoginPage
	Given I am a MyBlue Member on the Login Page
	
Registration Page View
	[Tags]		RegistrationPageView
	When I Click the "a#signUpMyBlueID" tracked link
	Then a page view “/registration/start” should be sent to Google Analytics
	