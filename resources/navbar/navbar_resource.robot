*** Settings ***
Documentation     A resource file with reusable keywords and variables.

# resource importation/extension
#Resource       ../common_resources.txt
Resource       ../login/login_resource.txt

*** Variables ***
${NAVBAR_SAMPLE_URL}=			${SERVER_NAVBAR}/sample.html
${MYBLUE_CSR_NAV}=				${SERVER_NAVBAR}/ESsample.html


*** Keywords ***
I am a logged in MyBlue Member on the myBlue site
	Teardown Browser
	Open new browser session at "${NAVBAR_SAMPLE_URL}"

I am a logged in MyBlue Member on a Partner site
	Teardown Browser
	Open new browser session at "${NAVBAR_SAMPLE_URL}"
	
I am logged into the MyBlue Portal
	Teardown Browser
	Open new browser session at "${SERVER}"
    Sleep    1s
    Wait for meda
	I Enter A Username "#LoginUsername" "${BASIC}"
	I Enter A Password "#LoginPassword" "${PASSWORD}"
	I Click the "div.login form#loginForm button#login" Navigation Button
    Sleep    1s
    Wait for meda

I am logged into the MyBlue Portal as a Standard User
	Teardown Browser
	Open new browser session at "${SERVER}"
    Sleep    1s
    Wait for meda
	I Enter A Username "#LoginUsername" "${STANDARD}"
	I Enter A Password "#LoginPassword" "${PASSWORD}"
	I Click the "div.login form#loginForm button#login" Navigation Button
    Sleep    1s
    Wait for meda
    
I am logged into the MyBlue Portal as a Terminated User
	Teardown Browser
	Open new browser session at "${SERVER}"
    Sleep    1s
    Wait for meda
	I Enter A Username "#LoginUsername" "${TERMINATED}"
	I Enter A Password "#LoginPassword" "${PASSWORD}"
	I Click the "div.login form#loginForm button#login" Navigation Button
    Sleep    1s
    Wait for meda
    
I am logged into the MyBlue Portal as a Minor User
	Teardown Browser
	Open new browser session at "${SERVER}"
    Sleep    1s
    Wait for meda
	I Enter A Username "#LoginUsername" "${MINOR}"
	I Enter A Password "#LoginPassword" "${PASSWORD}"
	I Click the "div.login form#loginForm button#login" Navigation Button
    Sleep    1s
    Wait for meda

I am logged into the MyBlue Portal as a Spouse User
	Teardown Browser
	Open new browser session at "${SERVER}"
    Sleep    1s
    Wait for meda
	I Enter A Username "#LoginUsername" "${SPOUSE}"
	I Enter A Password "#LoginPassword" "${PASSWORD}"
	I Click the "div.login form#loginForm button#login" Navigation Button
    Sleep    1s
    Wait for meda
	
I am logged in CSR
	Teardown Browser
	Open new browser session at "${CSR}"
    Sleep    1s
    Wait for meda
	
I am logged into the MyBlue Portal for the first time
	Teardown Browser
	I am a MyBlue Member on the Login Page
    Sleep    1s
    Wait for meda
	I Enter A Username "#LoginUsername" "${BASIC}"
    I Enter A Password "#LoginPassword" "${PASSWORD}"
    I Click the "#login" Button
    Sleep		${NAVIGATION}
    Go To		${NAVBAR_SAMPLE_URL}?showNavTour=true
    Sleep    1s
    Wait for meda