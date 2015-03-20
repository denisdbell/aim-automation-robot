*** Settings ***
Library           Selenium2Library
Suite Setup		  Environment setup
Suite Teardown	  Teardown Browser
Resource          ../../../../resources/pilot/login/login_resource.robot
Resource          ../../../../resources/classic/login/login_resource.robot
Resource          ../../../../resources/classic/registration/registration_resource.robot

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

Member ID Valid Data
	[Tags] 		MemberIdValidData		AIM1
	When I enter the text "R99900999" in "#contractNumber" textbox tracked for event "Registration:validate memberid - success"
	And I Click the next element "#firstName"
	Then I should see event for "Registration:validate memberid - success" logged in Google Analytics

Member ID Invalid Data
	[Tags] 		MemberIdInvalidData		AIM1
	When I enter the text "9999" in "#contractNumber" textbox tracked for event "Registration:validate memberid - failure"
	And I Click the next element "#firstName"
	Then I should see event for "Registration:validate memberid - failure" logged in Google Analytics

Firstname_Lastname No Data
	[Tags] 		FirstnameLastnameNoData		AIM1
	When I enter the text "" in "#firstName" textbox tracked for event "Registration:validate firstname lastname - failure"
	And I enter the text "" in "#lastName" textbox tracked for event "Registration:validate firstname lastname - failure"
	And I Click the next element "#birthday"
	Then I should see event for "Registration:validate firstname lastname - failure" logged in Google Analytics

Firstname No Data
	[Tags] 		FirstnameNoData		AIM1
	When I enter the text "" in "#firstName" textbox tracked for event "Registration:validate firstname lastname - failure"
	And I enter the text "dummy" in "#lastName" textbox tracked for event "Registration:validate firstname lastname - failure"
	And I Click the next element "#birthday"
	Then I should see event for "Registration:validate firstname lastname - failure" logged in Google Analytics

Lastname No Data
	[Tags] 		LastnameNoData		AIM1
	When I enter the text "dummy" in "#firstName" textbox tracked for event "Registration:validate firstname lastname - failure"
	And I enter the text "" in "#lastName" textbox tracked for event "Registration:validate firstname lastname - failure"
	And I Click the next element "#birthday"
	Then I should see event for "Registration:validate firstname lastname - failure" logged in Google Analytics

Firstname_Lastname Valid Data
	[Tags] 		FirstnameLastnameValidData		AIM1
	When I enter the text "dummy" in "#firstName" textbox tracked for event "Registration:validate firstname lastname - success"
	And I enter the text "dummy" in "#lastName" textbox tracked for event "Registration:validate firstname lastname - success"
	And I Click the next element "#birthday"
	Then I should see event for "Registration:validate firstname lastname - success" logged in Google Analytics

DOB No Data
	[Tags] 		DobNoData		AIM1
	When I enter the text "" in "#birthday" textbox tracked for event "Registration:validate dob - failure"
	And I Click the next element "#screenName"
	Then I should see event for "Registration:validate dob - failure" logged in Google Analytics

DOB Invalid Data
	[Tags] 		DobInvalidData		AIM1
	When I enter the text "20140980" in "#birthday" textbox tracked for event "Registration:validate dob - failure"
	And I Click the next element "#screenName"
	Then I should see event for "Registration:validate dob - failure" logged in Google Analytics

DOB Valid Data
	[Tags] 		DobValidData		AIM1
	When I enter the text "12/10/1999" in "#birthday" textbox tracked for event "Registration:validate dob - success"
	And I Click the next element "#screenName"
	Then I should see event for "Registration:validate dob - success" logged in Google Analytics

Username No Data
	[Tags] 		UsernameNoData		AIM1
	When I enter the text "" in "#screenName" textbox tracked for event "Registration:validate username - failure"
	And I Click the next element "#emailAddress"
	Then I should see event for "Registration:validate username - failure" logged in Google Analytics

Username Exists
	[Tags] 		UsernameExists		AIM1
	When I enter the text "marchcontractuat" in "#screenName" textbox tracked for event "Registration:validate username - failure"
	And I Click the next element "#emailAddress"
	Then I should see event for "Registration:validate username - failure" logged in Google Analytics

Username Invalid Length
	[Tags] 		UsernameInvalidLength		AIM1
	When I enter the text "ma" in "#screenName" textbox tracked for event "Registration:validate username - failure"
	And I Click the next element "#emailAddress"
	Then I should see event for "Registration:validate username - failure" logged in Google Analytics

Username Invalid Chars
	[Tags] 		UsernameInvalidChars		AIM1
	When I enter the text "m@rchcontr@ct_ut" in "#screenName" textbox tracked for event "Registration:validate username - failure"
	And I Click the next element "#emailAddress"
	Then I should see event for "Registration:validate username - failure" logged in Google Analytics

Username Valid Data
	[Tags] 		UsernameValidData		AIM1
	When I enter the text "testmember112814" in "#screenName" textbox tracked for event "Registration:validate username - success"
	And I Click the next element "#emailAddress"
	Then I should see event for "Registration:validate username - success" logged in Google Analytics

Email No Data
	[Tags] 		EmailNoData		AIM1
	When I enter the text "" in "#emailAddress" textbox tracked for event "Registration:validate email - failure"
	And I enter the text "" in "#emailAddress2" textbox tracked for event "Registration:validate verify email - failure"
	And I Click the next element "#password1"
	Then I should see event for "Registration:validate email - failure" logged in Google Analytics
	And I should see event for "Registration:validate verify email - failure" logged in Google Analytics

Email Invalid Data
	[Tags] 		EmailInvalidData		AIM1
	When I enter the text "invalid@email" in "#emailAddress" textbox tracked for event "Registration:validate email - failure"
	And I enter the text "invalid@email" in "#emailAddress2" textbox tracked for event "Registration:validate verify email - failure"
	And I Click the next element "#password1"
	Then I should see event for "Registration:validate email - failure" logged in Google Analytics

Email Exists
	[Tags] 		EmailExists		AIM1
	When I enter the text "mybluepvtest108@fepblue.org" in "#emailAddress" textbox tracked for event "Registration:validate email - failure"
	And I enter the text "mybluepvtest108@fepblue.org" in "#emailAddress2" textbox tracked for event "Registration:validate verify email - failure"
	And I Click the next element "#password1"
	Then I should see event for "Registration:validate email - failure" logged in Google Analytics

Email Verify Invalid
	[Tags] 		EmailVerifyInvalid		AIM1
	When I enter the text "valid@email.com" in "#emailAddress" textbox tracked for event "Registration:validate email - success"
	And I enter the text "invalid@email.com" in "#emailAddress2" textbox tracked for event "Registration:validate verify email - failure"
	And I Click the next element "#password1"
	Then I should see event for "Registration:validate verify email - failure" logged in Google Analytics

Email Valid Data
	[Tags] 		EmailValidData		AIM1
	When I enter the text "valid@email.com" in "#emailAddress" textbox tracked for event "Registration:validate email - success"
	And I enter the text "valid@email.com" in "#emailAddress2" textbox tracked for event "Registration:validate verify email - success"
	And I Click the next element "#password1"
	Then I should see event for "Registration:validate email - success" logged in Google Analytics
	And I should see event for "Registration:validate verify email - success" logged in Google Analytics

Password No Data
	[Tags] 		PasswordNoData		AIM1
	When I enter the text "" in "#password1" textbox tracked for event "Registration:validate password - failure"
	And I enter the text "" in "#password2" textbox
	And I Click the next element "#emailAddress2"
	Then I should see event for "Registration:validate password - failure" logged in Google Analytics

Password Invalid Data
	[Tags] 		PasswordInvalidData		AIM1
	When I enter the text "bigfun21" in "#password1" textbox tracked for event "Registration:validate password - failure"
	And I enter the text "bigfun21" in "#password2" textbox
	And I Click the next element "#emailAddress2"
	Then I should see event for "Registration:validate password - failure" logged in Google Analytics

Password Verify Invalid Data
	[Tags] 		PasswordVerifyInvalidData		AIM1
	When I enter the text "Bigfun21!" in "#password1" textbox tracked for event "Registration:validate password - failure"
	And I enter the text "Bigfun21" in "#password2" textbox tracked for event "Registration:validate verify password - failure"
	And I Click the next element "#emailAddress2"
	Then I should see event for "Registration:validate verify password - failure" logged in Google Analytics

Password Valid Data
	[Tags] 		PasswordValidData		AIM1
	When I enter the text "Bigfun21!" in "#password1" textbox tracked for event "Registration:validate password - success"
	And I enter the text "Bigfun21!" in "#password2" textbox tracked for event "Registration:validate verify password - success"
	And I Click the next element "#emailAddress2"
	Then I should see event for "Registration:validate password - success" logged in Google Analytics
	And I should see event for "Registration:validate verify password - success" logged in Google Analytics

Certification Page View
	[Tags]		CertificationPageView	AIM1
	When I Click the "#cert_btn" link tracked for page view /registration/certification
	Then I should see pageview for "/registration/certification" logged in Google Analytics

Certification Agree
	[Tags]		CertificationAgree	AIM1
	When I Click "#i_agree_CE" tracked for event "Registration:certification - agree"
	Then I should see event for "Registration:certification - agree" logged in Google Analytics

Certification Cancel
	[Tags]		CertificationCancel    AIM1
	When I Click the "#cert_btn" link tracked for page view /registration/certification
	And I Click "#conditionsDialog #condition_popup .button #cancel" tracked for event "Registration:certification - cancel"
	Then I should see event for "Registration:certification - cancel" logged in Google Analytics

Terms Of Service Page View
	[Tags]		TermsOfServicePageView	AIM1
	When I Click the "#tos_btn" link tracked for page view /registration/terms-of-service
	Then I should see pageview for "/registration/terms-of-service" logged in Google Analytics

Terms Of Service Agree
	[Tags]		TermsOfServiceAgree    AIM1
	When I Click "#i_agree_TOS" tracked for event "Registration:terms of service - agree"
	Then I should see event for "Registration:terms of service - agree" logged in Google Analytics

Terms Of Service Cancel
	[Tags]		TermsOfServiceCancel	AIM1
	When I Click the "#tos_btn" link tracked for page view /registration/terms-of-service
	And I Click "#tosDialog #condition_popup .button #cancel" tracked for event "Registration:terms of service - cancel"
	Then I should see event for "Registration:terms of service - cancel" logged in Google Analytics

Privacy Policy Page View
	[Tags]		PrivacyPolicyPageView	AIM1
	When I Click the "#pp_btn" link tracked for page view /registration/policy
	Then I should see pageview for "/registration/policy" logged in Google Analytics

Privacy Policy Agree
	[Tags]		PrivacyPolicyAgree    AIM1
	When I Click "#i_agree_PP" tracked for event "Registration:policy - agree"
	Then I should see event for "Registration:policy - agree" logged in Google Analytics

Privacy Policy Cancel
	[Tags]		PrivacyPolicyCancel    AIM1
	When I Click the "#pp_btn" link tracked for page view /registration/policy
	And I Click "#policyDialog #condition_popup .button #cancel" tracked for event "Registration:policy - cancel"
	Then I should see event for "Registration:policy - cancel" logged in Google Analytics

SSN Page View
	[Tags]		SsnPageView    AIM1
	When I enter the text "R99900999" in "#contractNumber" textbox tracked for event "Registration:validate memberid - success"
	And I enter the text "UNIVERSAL" in "#firstName" textbox tracked for event "Registration:validate firstname lastname - success"
	And I enter the text "TESTMEMBER" in "#lastName" textbox tracked for event "Registration:validate firstname lastname - success"
	And I enter the text "03/03/1972" in "#birthday" textbox tracked for event "Registration:validate dob - success"
	And I enter the text "testmember112814_2" in "#screenName" textbox tracked for event "Registration:validate username - success"
	And I enter the text "valid@email.com" in "#emailAddress" textbox tracked for event "Registration:validate email - success"
	And I enter the text "valid@email.com" in "#emailAddress2" textbox tracked for event "Registration:validate verify email - success"
	And I enter the text "Bigfun21!" in "#password1" textbox tracked for event "Registration:validate password - failure"
	And I enter the text "Bigfun21!" in "#password2" textbox tracked for event "Registration:validate verify password - failure"
	And I Click the "#cert_btn" link tracked for page view /registration/certification
	And I Click "#i_agree_CE" tracked for event "Registration:certification - agree"
	And I Click the "#tos_btn" link tracked for page view /registration/terms-of-service
	And I Click "#i_agree_TOS" tracked for event "Registration:terms of service - agree"
	And I Click the "#pp_btn" link tracked for page view /registration/policy
	And I Click "#i_agree_PP" tracked for event "Registration:policy - agree"
	And I Click the "#submit_btn" link tracked for page view /registration/validate_ssn
	Then I should see pageview for "/registration/validate_ssn" logged in Google Analytics

SSN No Data
	[Tags]		SsnNoData	AIM1
	When I enter the text "" in "#pinLast4SSN" textbox tracked for event "Registration:validate ssn - failure"
	And I Click "#pin_submit_btn" tracked for event "Registration:validate ssn - failure"
	Then I should see event for "Registration:validate ssn - failure" logged in Google Analytics

SSN Invalid Data
	[Tags]		SsnInvalidData	AIM1
	When I enter the text "234" in "#pinLast4SSN" textbox tracked for event "Registration:validate ssn - failure"
	And I Click "#pin_submit_btn" tracked for event "Registration:validate ssn - failure"
	Then I should see event for "Registration:validate ssn - failure" logged in Google Analytics

SSN Valid Data
	[Tags]		SsnValidData	AIM1
	When I am a MyBlue Member on the classic myBlue Login Page
	And I Click the "a#signUpMyBlueID" link tracked for page view /registration/start
	And I enter the text "R99900999" in "#contractNumber" textbox tracked for event "Registration:validate memberid - success"
	And I enter the text "UNIVERSAL" in "#firstName" textbox tracked for event "Registration:validate firstname lastname - success"
	And I enter the text "TESTMEMBER" in "#lastName" textbox tracked for event "Registration:validate firstname lastname - success"
	And I enter the text "03/03/1972" in "#birthday" textbox tracked for event "Registration:validate dob - success"
	And I enter the text "testmember112814_3" in "#screenName" textbox tracked for event "Registration:validate username - success"
	And I enter the text "valid@email.com" in "#emailAddress" textbox tracked for event "Registration:validate email - success"
	And I enter the text "valid@email.com" in "#emailAddress2" textbox tracked for event "Registration:validate verify email - success"
	And I enter the text "Bigfun21!" in "#password1" textbox tracked for event "Registration:validate password - failure"
	And I enter the text "Bigfun21!" in "#password2" textbox tracked for event "Registration:validate verify password - failure"
	And I Click the "#cert_btn" link tracked for page view /registration/certification
	And I Click "#i_agree_CE" tracked for event "Registration:certification - agree"
	And I Click the "#tos_btn" link tracked for page view /registration/terms-of-service
	And I Click "#i_agree_TOS" tracked for event "Registration:terms of service - agree"
	And I Click the "#pp_btn" link tracked for page view /registration/policy
	And I Click "#i_agree_PP" tracked for event "Registration:policy - agree"
	And I Click the "#submit_btn" link tracked for page view /registration/validate_ssn
	And I enter the text "3339" in "#pinLast4SSN" textbox tracked for event "Registration:validate ssn - success"
	And I Click "#pin_submit_btn" tracked for event "Registration:validate ssn - success"
	Then I should see event for "Registration:validate ssn - success" logged in Google Analytics















