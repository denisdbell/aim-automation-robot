*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library           Collections
Library    	      OperatingSystem

Resource          environment_setup.txt
Resource          aim_common.robot

*** Variables ***

#Users
${STANDARD}=					junecontractuatstd
${BASIC}=						marchcontractuat
${TERMINATED}=					test_account3
${TERMINATED_NOID}=				test_account3
${MINOR}=						ageless_18
${SPOUSE}=						marchspouseuat
${PASSWORD}=					Bigfun21!

*** Keywords ***

I am on a mobile device
	Set Window Size		400		700

I navigate to "${url}"
	Go To 		${url}
	Execute Javascript    document.cookie="robot_user=${ROBOT_USER};"


I enter the text "${text}" in "${element}" textbox
	Input Text		css=${element}		${text}


I Click the "${link}" link
	Click Element					css=${link}

I Click the "${link}" tracked link
	${linkhref}=	Get Element Attribute	css=${link}@href
	Get GA first rt:pageViews total for rt:pagePath ==${linkhref}
	Click Link					css=${link}
	Get GA next rt:pageViews total for rt:pagePath ==${linkhref}
	Sleep	5
	The next should be more than first
	
I Click the "${link}" tracked for event "${category}${action:\:.*}${label:\:.*}"
	Get GA first rt:pageViews total for rt:pagePath ==${linkhref}
	Click Link					css=${link}
	Get GA next rt:pageViews total for rt:pagePath ==${linkhref}

I Click the "${element}" element
	Click Element		css=${element}

I Click the "${button}" Button
	Click Button		css=${button}

I Click the "${button}" Navigation Button
	Click Button		sizzle=${button}
    Wait until keyword succeeds  180s  0.5s  Element Should Not Be Visible   sizzle=${button}

I Click the "${button}" Navigation Element
	Click Element		sizzle=${button}
    Wait until keyword succeeds  180s  0.5s  Element Should Not Be Visible   sizzle=${button}


I should see the element "${element}" displayed
	Element Should Be Visible		css=${element}

I should see the link "${text}" displayed
	Page Should Contain Link		css=${text}

I should see "${element}" have the text "${text}" displayed
	Element Should Contain		css=${element}		${text}

I should see the element "${element}" disabled
	Page Should Contain Element		css=${element}

I should see the loading popup visible
	Wait Until Element Is Visible		css=.loading		timeout=10.0

I should not see the element "${element}" disabled
	Page Should Not Contain Element			css=${element}

I should not see the element "${element}" displayed
	Element Should Not Be Visible		css=${element}

I should not see the element "${element}"
	Page Should Not Contain Element			css=${element}


I should be navigated to "${url}" in a new tab
	@{windows}=					Get Window Titles
	Select Window				@{windows}[1]
    Sleep    2s
    Wait for meda
	Location Should Contain		${url}

I should be navigated to "${url}"
    Sleep    2s
    Wait for meda
	Location Should Contain		${url}

I should not be redirected off the page "${url}"
	Location Should Contain		${url}

I view the "${element}" element
	Page Should Contain Element		css=${element}


I should see the link "${element}" with SSO link "${link}"
	${SSO}=	Get Element Attribute	css=${element}@href
	Should Be Equal	${SSO}	${link}

I should see "${element}" have attribute "${attribute}" with the value "${link}"
	${VALUE}=	Get Element Attribute	css=${element}@${attribute}
	Should Be Equal	${VALUE}	${link}

I Enter "${text}" in the "${element}" textfield
	Input Text		css=${element}		${text}

#WebMD
I enter a pin if necessary
	${URL}=	Get Location
	Run Keyword If		'${URL}'=='https://staging.webmdhealth.com/Registration/SecondFactorAuthentication.aspx/Sso'		I enter the pin "1234"

I enter the pin "${pin}"
	Sleep		${EVENT}
	Input Text			css=#Pin		${pin}
	Click Element		css=button[type="submit"]
    Sleep    2s
    Wait for meda

I navigate to the classic site
	Go To		${MYBLUE}
    Sleep    2s
    Wait for meda
	Execute Javascript    document.cookie="robot_user=${ROBOT_USER};"

I navigate to MyBlue Pilot
	Go To		${SERVER}
    Sleep    2s
    Wait for meda
	Execute Javascript    document.cookie="robot_user=${ROBOT_USER};"


Teardown Browser
    Close All Browsers

I ${command} and wait for meda
    ${myLocalURL} =  Get Location
    Run Keyword  I ${command}
    ${myLocalURL} =  Get Location
    Wait For Keyword To Succeed  Page Changes from ${myLocalURL}
    Wait for meda

Page Changes from ${oldLocalURL}
    Page Changes from ${myLocalURL}
    ${myLocalURL} =  Get Location
    ${result} =  Set Variable  false
    Run Keyword If  '${myLocalURL}'=='${oldLocalURL}'  Set Variable  \${result}  true
    [Return]  ${result}