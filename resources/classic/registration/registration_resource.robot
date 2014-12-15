*** Settings ***
Documentation     A resource file with reusable keywords and variables.

# resource importation/extension
Resource       ../../common_resources.robot
Resource	   ../../aim_common.robot


*** Keywords ****

Certification Not Checked
	#${category}=		Registration
	${action}=			certification - failure
	${filter}=    		Set Variable    rt:eventCategory=="Registration"
    Run Keyword If    '${action}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventAction==${action.replace(':','')}
    Get analytics event first total for ${filter}
    #Wait Until Element Is Visible    css=${link}	30s
    Sleep               ${NAVIGATION}
    Get analytics event second total for ${filter}

Terms Of Reference Not Checked
	${category}=	Registration
	${action}=	terms of service - failure
	${filter}=    Set Variable    rt:eventCategory==${category}
    Run Keyword If    '${action}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventAction==${action.replace(':','')}
    Get analytics event first total for ${filter}
    #Wait Until Element Is Visible    css=${link}	30s
    Sleep               ${NAVIGATION}
    Get analytics event second total for ${filter}

Policy Not Checked
	${category}=	Registration
	${action}=	policy - failure
	${filter}=    Set Variable    rt:eventCategory==${category}
    Run Keyword If    '${action}'!=''    Set Test Variable    ${filter}    ${filter};rt:eventAction==${action.replace(':','')}
    Get analytics event first total for ${filter}
    #Wait Until Element Is Visible    css=${link}	30s
    Sleep               ${NAVIGATION}
    Get analytics event second total for ${filter}


	
	
