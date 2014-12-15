*** Settings ***
Documentation     A resource file with reusable keywords and variables.

# resource importation/extension
Resource       ../../common_resources.robot


*** Keywords ****

I am a MyBlue Member on the classic myBlue Login Page
	Teardown Browser
	Open new browser session at "${MYBLUE_LOGIN_URL}"