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
	When I Click the "a#signUpMyBlueID" link tracked for page view /registration/start
	Then I should see pageview for "/registration/start" logged in Google Analytics
	
Member ID No Data
	[Tags] 		 MemberIdNoData		AIM1
	When I enter the text "" in "#contractNumber" textbox tracked for event "Registration:validate memberid - failure:Required information is missing"
	And I Click the next element "#firstName"
	Then I should see event for "Registration:validate memberid - failure:Required information is missing." logged in Google Analytics

Member ID Invalid Data
	[Tags] 		MemberIdInvalidData		AIM1
	When I enter the text "9999" in "#contractNumber" textbox tracked for event "Registration:validate memberid - failure"
	And I Click the next element "#firstName"
	Then I should see event for "Registration:validate memberid - failure" logged in Google Analytics