*** Settings ***
Suite Setup       Environment setup
Suite Teardown    Teardown Browser
Library           Selenium2Library
Resource          ../../../../resources/pilot/login/login_resource.robot
Resource          ../../../../resources/classic/login/login_resource.robot
Resource          ../../../../resources/aim_common.robot

*** Test Cases ***
Initialize
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page
    And I have Entered Second Factor Authentication
    And I am a Registered MyBlue Member on the Landing Page (Session exists)
    And I have Entered Security Question

Blue Health Assessment Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.bha\"] a" link tracked for page view /hra/lobby.aspx?toolid=3563
    Then I should see pageview for "/hra/lobby.aspx?toolid=3563" logged in Google Analytics

Online Health Coach Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.onlineHealthCoach\"] a" link tracked for page view /!dha/checkin
    Then I should see pageview for "/!dha/checkin" logged in Google Analytics

Action Plan Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.actionPlan\"] a" link tracked for page view /BCBSA/main/HomePage.aspx
    Then I should see pageview for "/BCBSA/main/HomePage.aspx" logged in Google Analytics

Benefits Statements Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.benefitStatement\"] a" link tracked for page view /BenefitStatement/Dashboard.aspx
    Then I should see pageview for "/BenefitStatement/Dashboard.aspx" logged in Google Analytics

Tobacco Sessation Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.tobaccoCessation\"] a" link tracked for page view /!dha/checkin
    Then I should see pageview for "/!dha/checkin" logged in Google Analytics

Nurse Line Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.nurseLine\"] a" link tracked for page view /Messaging/NurseLine.aspx/NurseLineLobby
    Then I should see pageview for "/Messaging/NurseLine.aspx/NurseLineLobby" logged in Google Analytics

Personal Health Record Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.personalHealthRecord\"] a" link tracked for page view /phr/healthrecord/default.aspx
    Then I should see pageview for "/phr/healthrecord/default.aspx" logged in Google Analytics

Heatlh Trackers Record Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR    HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.healthTrackers\"] a" link tracked for page view /!trackers
    Then I should see pageview for "/!trackers" logged in Google Analytics

Documentary Library Trackers Record Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.documentLibrary\"] a" link tracked for page view /phr/documents/list.aspx
    Then I should see pageview for "/phr/documents/list.aspx" logged in Google Analytics

Online Symptom Checker Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.onlineSymptomChecker\"] a" link tracked for page view /!symptomchecker
    Then I should see pageview for "/!symptomchecker" logged in Google Analytics

My Pregnancy Assistant Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.myPregnancyAssistant\"] a" link tracked for page view /PregnancyAssistant/Dashboard.aspx
    Then I should see pageview for "/PregnancyAssistant/Dashboard.aspx" logged in Google Analytics

Healthy Families Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.healthyFamilies\"] a" link tracked for page view /BCBSA/HealthyFamily/
    Then I should see pageview for "/BCBSA/HealthyFamily/" logged in Google Analytics

Recipes Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.recipes\"] a" link tracked for page view /Recipe/Recipes.aspx
    Then I should see pageview for "/Recipe/Recipes.aspx" logged in Google Analytics

Health Topics Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.allTopics\"] a" link tracked for page view /healthtopics/topicslobby.aspx
    Then I should see pageview for "/healthtopics/topicslobby.aspx" logged in Google Analytics

Conditions Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.conditions\"] a" link tracked for page view /healthtopics/topicslobby.aspx
    Then I should see pageview for "/healthtopics/topicslobby.aspx" logged in Google Analytics

Procedures/Surgeries Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.proceduresSurgeries\"] a" link tracked for page view /healthtopics/topicslobby.aspx
    Then I should see pageview for "/healthtopics/topicslobby.aspx" logged in Google Analytics

WebMD Videos Link Should Be Tracked In Google Analytics
    [Tags]    NAVBAR HEALTH_TOOLS    AIM1
    Given I am a Registered MyBlue Member on the Landing Page (Session exists)
    When I Click the "#health-tools" element
    And I Click the "li[data-url-config=\"navigation.main.healthTools.nodes.webMDVideo\"] a" link tracked for page view /video/lobby
    Then I should see pageview for "/video/lobby" logged in Google Analytics
