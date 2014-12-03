*** Settings ***
Library           Selenium2Library
Suite Setup		  Environment setup
Suite Teardown	  Teardown Browser
Resource          ../../../../resources/pilot/login/login_resource.txt

*** Test Cases ***

Login Page
	[Tags]		LoginPage
	Given I am a MyBlue Member on the Login Page
	
Registration Page View
	[Tags]		RegistrationPageView	AIM1
	When I Click the "a#signUpMyBlueID" link tracked for virtual page view “/registration/start”
	Then a Page View “/registration/start” is sent to Google Analytics
	