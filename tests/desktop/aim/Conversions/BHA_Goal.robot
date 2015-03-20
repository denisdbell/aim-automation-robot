*** Settings ***
Suite Setup       Environment setup
Library           Selenium2Library    #Suite Teardown    Teardown Browser
Resource          ../../../../resources/pilot/login/login_resource.robot
Resource          ../../../../resources/classic/login/login_resource.robot
Resource          ../../../../resources/aim_common.robot

*** Test Cases ***
Initialize
    [Tags]    GOALS    BHA Goal    AIM1
    Given I am a Registered MyBlue Member on the Landing Page
    And I have Entered Second Factor Authentication

Blue Health Assessment Goal Should Be Tracked In Google Analytics
    [Tags]    GOALS    BHA Goal    AIM1    AIM
    Given I Expect goal "11" to convert
    When I Have Completed The BHA Goal
    Then I Should see goal "11" tracked in google analytics

Test a thing
    [Tags]    Testating
    ${vall} =    Evaluate    urllib.quote('something new', '')  urllib
    Log    ${vall}
    Log    ${vall.encode('utf-8')}
    Log    ${vall.encode()}
