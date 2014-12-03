*** Settings ***
Library           Selenium2Library
Suite Setup		  Environment setup
Suite Teardown	  Teardown Browser
Resource          ../../../../resources/pilot/login/login_resource.txt

*** Test Cases ***

Login Page
	[Tags]		LoginPage	AIM1
	Given I am a MyBlue Member on the classic myBlue Login Page
	
Registration Page View
	[Tags]		RegistrationPageView	AIM1
	#When I Click the "a#signUpMyBlueID" link tracked for virtual page view “/web/guest/myblue”
	When I Click the "a#signUpMyBlueID" tracked link
	#Then Page View “/web/guest/myblue” is sent to Google Analytics
	
	