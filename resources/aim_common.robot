*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           Selenium2Library

*** Variables ***
${GA_USER}        x@medullan.com
${GA_PASSWORD}    somethingprivate
${GA_KEY}         AIzaSyCFj15TpkchL4OUhLD1Q2zgxQnMb7v3XaM
${GA_DIMENSION}    rt:pagePath
${GA_METRIC}      rt:pageViews
${GA_PROFILE_ID}    ga:92933908    #ga:81808767    #92930649
${GA_BEARER_TOKEN}    Bearer ya29.zABUvOPcIbadhwL2XiBdatTF7LXfIrp3Gd6Xd67QQUaPcb_t2JvUVy4WVZJj8ws9pkPamoJC400fBA
${GA_REAL_TIME_DATA_ENDPOINT}    https://content.googleapis.com
${GA_REALTIME_CONSOLE}    https://developers.google.com/analytics/devguides/reporting/realtime/v3/reference/data/realtime/get
${GA_FILTERS}     rt:pagePath==/pilot/login
${GA_OAUTH_URL}    https://accounts.google.com
${GA_OAUTH_CODE}    4/Riiyc05y8zYLlWdK8ucZf_1FYJVDflXtbCvPwe6GbxQ.oot9bJHgE_EZsjMf6whcw_5VfaaqkwI
${GA_OAUTH_CLIENT}    519024691571-ahkuf7ba5qpfla6971gf7duc3live6u0.apps.googleusercontent.com
${GA_OAUTH_SECRET}    -i47fqbeKw-orpZr6YyCIKIo
${GA_OAUTH_REDIRECT}    urn:ietf:wg:oauth:2.0:oob
${GA_OAUTH_SCOPE}    https://www.googleapis.com/auth/analytics.readonly
${GA_OAUTH_GRANT_TYPE}    authorization_code
${GA_OAUTH_LOGIN}    ${GA_OAUTH_URL}/o/oauth2/auth?redirect_uri=${GA_OAUTH_REDIRECT}&scope=${GA_OAUTH_SCOPE}&response_type=code&client_id=${GA_OAUTH_CLIENT}

*** Keywords ***
The ${arg0} should be same as ${arg1}
    Should Be Equal    ${${arg0}}    ${${arg1}}

The ${arg0} should be more than ${arg1}
    Should Be True    ${${arg0}} > ${${arg1}}

Get analytics event ${varName} total for ${criteria}
    ${counts}=    Get Google Analytics Page Hit ga-page-count ${GA_KEY} ${GA_PROFILE_ID} rt:totalEvents rt:eventCategory ${criteria}
    Set Test Variable    ${${varName}}    ${counts['rt:totalEvents']}
    [Return]    ${counts['rt:totalEvents']}

Get analytics ${varName} conversions for ${goal:\d+}
    ${counts}=    Get Google Analytics Page Hit ga-goal-count ${GA_KEY} ${GA_PROFILE_ID} rt:goalCompletionsAll rt:goalId rt:goalId==${goal}
    Set Test Variable    ${${varName}}    ${counts['rt:goalCompletionsAll']}
    [Return]    ${counts['rt:goalCompletionsAll']}

Get GA ${varName} ${metric} total for ${field} ${criteria}
    ${counts}=    Get Google Analytics Page Hit ga-page-count ${GA_KEY} ${GA_PROFILE_ID} ${metric} ${field} ${field}${criteria}
    #Log To Console    ${counts}
    Set Test Variable    ${${varName}}    ${counts['${metric}']}
    [Return]    ${counts['${metric}']}

Check Analytics Hit ${ref} ${path} ${criteria}
    ${counts}=    Get Google Analytics Page Hit ${ref} ${GA_KEY} ${GA_PROFILE_ID} ${GA_METRIC} ${GA_DIMENSION} ${criteria}
    [Return]    ${counts}

Get Google Analytics Page Hit ${ga} ${gaKey} ${profileId} ${metrics} ${dims} ${filter}
    Run Keyword    Create Session    ${ga}    ${GA_REAL_TIME_DATA_ENDPOINT}
    ${params}=    Set Variable    ids=${profileId}&metrics=${metrics}&dimensions=${dims}&filters=${filter}
    ${headers}=    Create Dictionary    Authorization=${GA_BEARER_TOKEN}
    #Log Dictionary    ${headers}
    ${resp}=    Run Keyword    Get    ${ga}    /analytics/v3/data/realtime?${params}    headers=${headers}
    ${jsondata}=    To Json    ${resp.content}
    #Log To Console    ${jsondata}
    #Log Dictionary    ${jsondata}
    [Return]    ${jsondata['totalsForAllResults']}

Initialize Google Bearer Token
    #Open Browser    ${GA_OAUTH_LOGIN}    ${BROWSER}
    # assign google analytics username and password from environment variables if not already set
    Run Keyword If  '${GA_USER}'=='x@medullan.com'  Set Global Variable  \${GA_PASSWORD}  %{GA_PASSWORD}
    Run Keyword If  '${GA_USER}'=='x@medullan.com'  Set Global Variable  \${GA_USER}  %{GA_USER}
    Open new browser session at "${GA_OAUTH_LOGIN}"
    Input Text    Email    ${GA_USER}
    Input Password    Passwd    ${GA_PASSWORD}
    Click Button    signIn
    Wait Until Element Is Visible    css=#submit_approve_access    30s
    Sleep    2s
    Click Button    submit_approve_access
    Sleep    2s
    Wait Until Element Is Visible    css=#code
    ${code}    Get Value    css=#code
    #Log    ${code}
    Create Session    google_oauth    ${GA_OAUTH_URL}
    ${params}=    Create Dictionary    code=${code}    grant_type=${GA_OAUTH_GRANT_TYPE}    redirect_uri=${GA_OAUTH_REDIRECT}
    Set To Dictionary    ${params}    client_secret=${GA_OAUTH_SECRET}    client_id=${GA_OAUTH_CLIENT}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}=    Post    google_oauth    /o/oauth2/token    data=${params}    headers=${headers}
    ${jsondata}    To Json    ${resp.content}
    #Log Dictionary    ${jsondata}
    Set Global Variable    ${GA_BEARER_TOKEN}    Bearer ${jsondata['access_token']}
    [Return]    ${jsondata}

I Click "${link}" tracked link
    ${linkhref}=    Get Element Attribute    css=${link}@href
    Get GA first rt:pageViews total for rt:pagePath ==${linkhref}
    Wait Until Element Is Visible    css=${link}    10s
    Click Element    css=${link}
    Sleep  2s
    Wait for meda
    Get GA second rt:pageViews total for rt:pagePath ==${linkhref}

I Click the "${link}" link tracked for page view ${path}
    Get GA first rt:pageViews total for rt:pagePath ==${path}
    Wait Until Element Is Visible    css=${link}    10s
    Click Element    css=${link}
    Wait for meda
    Execute Javascript    (function(d,c,r){if(d[c].indexOf(r))return; d[c]=r; location.reload() })(document,"cookie","robot_user=${ROBOT_USER}")
    #Reload Page
    Sleep  1s
    Wait for meda
    Get GA second rt:pageViews total for rt:pagePath ==${path}
    Run Keyword If  '${first}'=='${second}'  Sleep  1s
    Run Keyword If  '${first}'=='${second}'  Get GA second rt:pageViews total for rt:pagePath ==${path}
    Run Keyword If  '${first}'=='${second}'  Sleep  3s
    Run Keyword If  '${first}'=='${second}'  Get GA second rt:pageViews total for rt:pagePath ==${path}
    Run Keyword If  '${first}'=='${second}'  Sleep  1s
    Run Keyword If  '${first}'=='${second}'  Get GA second rt:pageViews total for rt:pagePath ==${path}

I Expect goal "${goalNumber}" to convert
    Get analytics first${goalNumber} conversions for ${goalNumber}

I Should see goal "${goalNum}" tracked in google analytics
    Get analytics second${goalNum} conversions for ${goalNum}
    Run Keyword If  '${first${goalNum}}'=='${second${goalNum}}'  Sleep  2s
    Run Keyword If  '${first${goalNum}}'=='${second${goalNum}}'  Get analytics second${goalNum} conversions for ${goalNum}
    The second${goalNum} should be more than first${goalNum}

I Click "${link}" tracked for event "${category:[^:]*}${action:(\:|)[^:]*}${label:(\:|).*}"
    ${filter}=    Set Variable    rt:eventCategory==${category}
    Run Keyword If    '${action}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventAction==${action.replace(':','')}
    Run Keyword If    '${label}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventLabel==${label.replace(':','')}
    Get analytics event first total for ${filter}
    Wait Until Element Is Visible    css=${link}    30s
    Click Element    css=${link}
    Sleep    2s
    Wait for meda
    Get analytics event second total for ${filter}
    Run Keyword If  '${first}'=='${second}'  Sleep  2s
    Run Keyword If  '${first}'=='${second}'  Get analytics event second total for ${filter}

I Click "${link}" link tracked for event "${category:[^:]*}${action:(\:|)[^:]*}${label:(\:|).*}"
    ${filter}=    Set Variable    rt:eventCategory==${category}
    Run Keyword If    '${action}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventAction==${action.replace(':','')}
    Run Keyword If    '${label}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventLabel==${label.replace(':','')}
    Get analytics event first total for ${filter}
    Wait Until Page Contains    ${link}    30s
    Click Link    ${link}
    Sleep    2s
    Wait for meda
    Get analytics event second total for ${filter}
    Run Keyword If  '${first}'=='${second}'  Sleep  2s
    Run Keyword If  '${first}'=='${second}'  Get analytics event second total for ${filter}

I enter the text "${text}" in "${element}" textbox tracked for event "${category:[^:]*}${action:(\:|)[^:]*}${label:(\:|).*}"
    ${filter}=    Set Variable    rt:eventCategory==${category}
    Run Keyword If    '${action}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventAction==${action.replace(':','')}
    Run Keyword If    '${label}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventLabel==${label.replace(':','')}
    Get analytics event first total for ${filter}
    Wait Until Element Is Visible    css=${element}    30s
    Input Text    css=${element}    ${text}

I Input Text ${element} ${text}
    Wait Until Element Is Visible    css=${element}    30s
    Input Text    css=${element}    ${text}

I Click the next element "${element}"
    Wait Until Element Is Visible    css=${element}    30s
    Click Element    css=${element}
    Sleep    2s
    Wait for meda
    Get analytics event second total for ${filter}

I Click on link "${element}"
    I close the tour popup
    Wait Until Page Contains    ${element}    30s
    Click Link    ${element}
    Sleep    2s
    Wait for meda

I Click on element "${element}"
    I close the tour popup
    Wait Until Element Is Visible    css=${element}    30s
    Click Element    css=${element}
    Sleep    2s
    Wait for meda

I should see ${hitType} for "${hitDescription}" logged in Google Analytics
    ${currentLocation}=  Get Location
    Log  Browser URL :: ${currentLocation}
    The second should be more than first

I should not see ${hitType} for "${hitDescription}" logged in Google Analytics
    The second should be same as first

Find Image by "${component}"
    Sleep  1s
    ${encodedComponent} =    Evaluate    urllib.quote('${component}', '')  urllib
    ${image} =    Execute Javascript    for(var i=document.images.length-1; i >= 0; i--) if(document.images[i].src.indexOf('${encodedComponent}') >= 0){ return true; } return false;
    [Return]    ${image}

Find ${tracking} Image by "${component}"
    Sleep  1s
    ${encodedComponent} =    Evaluate    urllib.quote('${component}', '')  urllib
    ${image} =    Execute Javascript    for(var i=document.images.length-1; i >= 0; i--) if(document.images[i].src.indexOf('${tracking}') && document.images[i].src.indexOf('${encodedComponent}') >= 0){ return true; } return false;
    [Return]    ${image}

    #________________ Setup open browser keyword action based on selected device _________________#

Open new browser session at "${url}"
    #Run Keyword If    '${BROWSER}'=='iphone'    Setup Iphone Emulator "${url}"
    #Run Keyword If    '${BROWSER}'=='chrome'    Setup Desktop Environment "${url}"
    #Run Keyword If    '${BROWSER}'=='firefox'    Setup Desktop Environment "${url}"
    #Run Keyword If    '${BROWSER}'=='safari'    Setup Desktop Environment "${url}"
    #Run Keyword If    '${BROWSER}'=='ie'    Setup Desktop Environment "${url}"
    Run Keyword If    '${BROWSER}'=='phantomjs'    Setup Desktop Environment "${url}"
    Run Keyword If    '${BROWSER}'!='phantomjs'    Setup Desktop Environment "${url}"
    Run Keyword If    '${TEAM}'=='AIM'    Execute Javascript    document.cookie="robot_user=${ROBOT_USER};"

Setup Desktop Environment "${url}"
    Log  Sauce Caps ${SAUCE_CAPABILITIES}
    Run Keyword If  '${SAUCE_URL}' != ''  Open Browser  ${url}  remote_url=${SAUCE_URL}  desired_capabilities=${SAUCE_CAPABILITIES}
    Run Keyword If  '${SAUCE_URL}' == ''  Open Browser  ${url}  browser=${BROWSER}
    Run Keyword If  '${SELENIUM_DEVICE}'==''    Maximize Browser Window

Setup Iphone Emulator "${url}"
    Open Browser    url=${url}    browser=${BROWSER}    alias=${ALIAS}    remote_url=${REMOTE_URL}    desired_capabilities=${IPHONE_DESIRED_CAPABILITIES}
    Sleep    ${DEVICE_LAUNCH}

Wait for meda
    [Arguments]  ${waittime}=30s
    Wait Until Keyword Succeeds    ${waittime}    0.5s    Find Image by "page"