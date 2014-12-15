*** Settings ***
Documentation     A resource file with reusable keywords and variables.

# resource importation/extension
Resource       ../../common_resources.robot
Resource       ../../classic/login/login_resource.robot


*** Keywords ****

I am a MyBlue Member navigating to the login page
	Teardown Browser
	Open new browser session at "${LOGIN_URL}"

I am a MyBlue Member on the Login Page
	Teardown Browser
	Open new browser session at "${LOGIN_URL}"
	Sleep		${NAVIGATION}
	
I Am Navigated to Landing Page "${pageElement}"
	Page Should Contain Element		css=${pageElement}

I Am Not Navigated to Landing Page "${pageElement}"
	Element Should Not Be Visible		css=${pageElement}

I Enter A Username "${element}" "${text}"
	Input Text		css=${element}		${text}
							
I Enter A Password "${element}" "${text}"
	Input Password		css=${element}		${text}

I should see the element "${element}" blank
	Element Text Should Be 		css=${element}	${EMPTY}		

I enter text in the "${element}" textbox
	Input Text "thor"		${element}	
