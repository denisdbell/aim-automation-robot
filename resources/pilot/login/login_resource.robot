*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Resource          ../../common_resources.robot    # resource importation/extension
Resource          ../../classic/login/login_resource.robot

*** Keywords ***
I am a MyBlue Member navigating to the login page
    Teardown Browser
    Open new browser session at "${LOGIN_URL}"

I am a MyBlue Member on the Login Page
    Teardown Browser
    Open new browser session at "${LOGIN_URL}"
    Sleep    ${NAVIGATION}

I Am Navigated to Landing Page "${pageElement}"
    Page Should Contain Element    css=${pageElement}

I Am Not Navigated to Landing Page "${pageElement}"
    Element Should Not Be Visible    css=${pageElement}

I Enter A Username "${element}" "${text}"
    Input Text    css=${element}    ${text}

I Enter A Password "${element}" "${text}"
    Input Password    css=${element}    ${text}

I should see the element "${element}" blank
    Element Text Should Be    css=${element}    ${EMPTY}

I enter text in the "${element}" textbox
    Input Text "thor"    ${element}

I Am Navigated to Member Id Card Page "${pageElement}"
    Page Should Contain Element    ${pageElement}

The "${step}" step is completed
    I should see the element "${step}" displayed

The "${step}" step is not completed
    I should see the element "${step}" displayed

The "${step}" step is not highlighted
    I should not see the element "${step}" displayed

The "${step}" step is highlighted
    I should see the element "${step}" displayed

The "${step}" step is enabled
    The "${step}" step is highlighted

The "${step}" step is not enabled
    I should not see the element "${step}" displayed

I am a Registered MyBlue Member on the Landing Page (Session exists)
    Go To    ${SERVER}/landingpage
    Sleep    ${EVENT}

I am on the MyBlue Public Site
    Teardown Browser
    Open new browser session at "${PUBLIC_SITE}"

I am on the MyBlue Public Site (Session exists)
    Go To    ${PUBLIC_SITE}

I am a Registered MyBlue Member on the Landing Page
    Teardown Browser
    I am a MyBlue Member on the Login Page
    I Enter A Username "#LoginUsername" "${BASIC}"
    I Enter A Password "#LoginPassword" "${PASSWORD}"
    I Click the "div.login form#loginForm button#login" Button
    Sleep    ${NAVIGATION}

I am a Standard Registered MyBlue Member on the Landing Page
    Teardown Browser
    I am a MyBlue Member on the Login Page
    I Enter A Username "#LoginUsername" "${STANDARD}"
    I Enter A Password "#LoginPassword" "${PASSWORD}"
    I Click the "div.login form#loginForm button#login" Button
    Sleep    ${NAVIGATION}

I am a Terminated Registered MyBlue Member on the Landing Page
    Teardown Browser
    I am a MyBlue Member on the Login Page
    I Enter A Username "#LoginUsername" "${TERMINATED}"
    I Enter A Password "#LoginPassword" "${PASSWORD}"
    I Click the "div.login form#loginForm button#login" Button
    Sleep    ${NAVIGATION}

I am a Minor Registered MyBlue Member on the Landing Page
    Teardown Browser
    I am a MyBlue Member on the Login Page
    I Enter A Username "#LoginUsername" "${MINOR}"
    I Enter A Password "#LoginPassword" "${PASSWORD}"
    I Click the "div.login form#loginForm button#login" Button
    Sleep    ${NAVIGATION}

I have Entered Second Factor Authentication
    Sleep    ${NAVIGATION}
    #Wait Until Page Contains    css=div.quicknav-symptom #symptomChecker
    I Click the "div.quicknav-symptom #symptomChecker" link
    Input Text    css=#Pin    1234
    Click Element    css=.finish

I have Entered Security Question
    When I Click the "#wellness" element
    Sleep    ${NAVIGATION}
    I Click the "li[data-url-config=\"navigation.main.wellness.nodes.wellnessCardBalance\"] a" link
    Wait Until Element Is Visible    css=#answer
    Input Text    css=#answer    cheese
    Click Button    Submit

I am on the MyBlue Registration Page
    Given I am a MyBlue Member on the classic myBlue Login Page
    And I Click the "#signUpMyBlueID" element

I Have Completed The BHA Goal
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    Sleep    ${NAVIGATION}
    And Click Link    Blue Health Assessment
    And Click Link    Update Score
    And Click Element    css=.finish
    And Wait Until Element Is Visible    css=.save
    And Click Element    css=.save
    And Wait Until Element Is Visible    css=.ok
    Sleep    5s
    And Click Element    css=.ok
