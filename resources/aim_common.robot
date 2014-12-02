*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           Selenium2Library

*** Variables ***
${GA_USER}                      medullan.beach@gmail.com
${GA_PASSWORD}                  !Medullan5
${GA_KEY}                       AIzaSyCFj15TpkchL4OUhLD1Q2zgxQnMb7v3XaM
${GA_DIMENSION}                 rt:pagePath
${GA_METRIC}                    rt:pageViews
${GA_PROFILE_ID}                ga:92930649
${GA_BEARER_TOKEN}              Bearer ya29.zABUvOPcIbadhwL2XiBdatTF7LXfIrp3Gd6Xd67QQUaPcb_t2JvUVy4WVZJj8ws9pkPamoJC400fBA
${GA_REAL_TIME_DATA_ENDPOINT}   https://content.googleapis.com
${GA_REALTIME_CONSOLE}          https://developers.google.com/analytics/devguides/reporting/realtime/v3/reference/data/realtime/get
${GA_FILTERS}                   rt:pagePath==/pilot/login

${GA_OAUTH_URL}         https://accounts.google.com
${GA_OAUTH_CODE}        4/Riiyc05y8zYLlWdK8ucZf_1FYJVDflXtbCvPwe6GbxQ.oot9bJHgE_EZsjMf6whcw_5VfaaqkwI
${GA_OAUTH_CLIENT}      519024691571-ahkuf7ba5qpfla6971gf7duc3live6u0.apps.googleusercontent.com
${GA_OAUTH_SECRET}      -i47fqbeKw-orpZr6YyCIKIo
${GA_OAUTH_REDIRECT}    urn:ietf:wg:oauth:2.0:oob
${GA_OAUTH_SCOPE}       https://www.googleapis.com/auth/analytics.readonly
${GA_OAUTH_GRANT_TYPE}  authorization_code

${GA_OAUTH_LOGIN}          ${GA_OAUTH_URL}/o/oauth2/auth?redirect_uri=${GA_OAUTH_REDIRECT}&scope=${GA_OAUTH_SCOPE}&response_type=code&client_id=${GA_OAUTH_CLIENT}

*** Keywords ***
The ${arg0} should be same as ${arg1}
    Should Be Equal    ${${arg0}}    ${${arg1}}

The ${arg0} should be more than ${arg1}
    Should Be True    ${${arg0}} > ${${arg1}}

Get GA ${varName} ${metric} total for ${field} ${criteria}
    ${counts}=    Get Google Analytics Page Hit ga-page-count ${GA_KEY} ${GA_PROFILE_ID} ${GA_METRIC} ${field} ${field}${criteria}
    Set Test Variable    ${${varName}}    ${counts['${metric}']}
    [Return]    ${counts['${metric}']}

Check Analytics Hit ${ref} ${path} ${criteria}
    ${counts}=    Get Google Analytics Page Hit ${ref} ${GA_KEY} ${GA_PROFILE_ID} ${GA_METRIC} ${GA_DIMENSION} ${criteria}
    [Return]    ${counts}

Get Google Analytics Page Hit ${ga} ${gaKey} ${profileId} ${metrics} ${dims} ${filter}
    Run Keyword    Create Session    ${ga}    ${GA_REAL_TIME_DATA_ENDPOINT}
    #URL Parameters to be passed to GA Real Time Endpoint
    ${params}=    Create Dictionary    ids=${profileId}    key=${gaKey}
    Set To Dictionary    ${params}    metrics=${metrics}    dimensions=${dims}    filters=${filter}
    #Headers to be passed to GA Real Time Endpoint
    ${headers}=    Create Dictionary    authorization=${GA_BEARER_TOKEN}    referer=${GA_REALTIME_CONSOLE}
    #Response recieved from ga realtime end point
    ${resp}=    Run Keyword    Get    ${ga}    /analytics/v3/data/realtime    params=${params}    headers=${headers}
    ${jsondata}=    To Json    ${resp.content}
    Log Dictionary    ${jsondata}
    [Return]    ${jsondata['totalsForAllResults']}

Initialize Google Bearer Token
    Open Browser    ${GA_OAUTH_LOGIN}    ${BROWSER}
    Input Text    Email     ${GA_USER}
    Input Text    Passwd    ${GA_PASSWORD}
    Click Button    signIn
    Wait Until Element Is Visible    css=#submit_approve_access
    Sleep    3s
    Click Button    submit_approve_access
    ${code}    Get Value    css=#code
    Log    ${code}
    Create Session    google_oauth    ${GA_OAUTH_URL}
    ${params}=    Create Dictionary    code=${code}    redirect_uri=${GA_OAUTH_REDIRECT}    grant_type=${GA_OAUTH_GRANT_TYPE}
    Set To Dictionary    ${params}    client_secret=${GA_OAUTH_SECRET}    client_id=${GA_OAUTH_CLIENT}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}=    Post    google_oauth    /o/oauth2/token    params=${params}    headers=${headers}
    ${jsondata}    To Json    ${resp.content}
    Log Dictionary    ${jsondata}
    [Return]    ${jsondata}


