*** Settings ***
Suite Setup       Environment setup
Suite Teardown    Teardown Browser
Library           Selenium2Library
Resource          ../../../../resources/pilot/login/login_resource.robot
Resource          ../../../../resources/classic/login/login_resource.robot
Resource          ../../../../resources/aim_common.robot

*** Test Cases ***
Find A Doctor Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    PUBLIC_SITE    AIM1
    Given I am on the MyBlue Public Site
    And I Click the "a[href="/en/find-a-doctor"]" link tracked for page view /en/find-a-doctor
    Then I should see pageview for "/en/find-a-doctor" logged in Google Analytics

Start Saving Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    PUBLIC_SITE    AIM1
    I am on the MyBlue Public Site (Session exists)
    And I Click the "a[href="/en/wellness-resources-and-tools"]" link tracked for page view /en/wellness-resources-and-tools
    Then I should see pageview for "/en/wellness-resources-and-tools" logged in Google Analytics

Accessability Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    PUBLIC_SITE    AIM1
    I am on the MyBlue Public Site (Session exists)
    And I Click the "a[href="/en/accessibility"]" link tracked for page view /en/accessibility
    Then I should see pageview for "/en/accessibility" logged in Google Analytics

Contact Us Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    PUBLIC_SITE    AIM1
    I am on the MyBlue Public Site (Session exists)
    And I Click the "a[href="/en/contact-us"]" link tracked for page view /en/contact-us
    Then I should see pageview for "/en/contact-us" logged in Google Analytics

Customer Service Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    PUBLIC_SITE    AIM1
    I am on the MyBlue Public Site (Session exists)
    And I Click the "a[href="/en/faqs-customer-service"]" link tracked for page view /en/faqs-customer-service
    Then I should see pageview for "/en/faqs-customer-service" logged in Google Analytics
