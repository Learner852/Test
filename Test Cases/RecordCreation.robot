*** Settings ***
Resource         ../Resources/common.robot
Test Setup       Setup Browser
Test Teardown    End suite


*** Test Cases ***
Create Account Object Records
    [Documentation]    will create account Records
    [Tags]             testgen    authenticate
    NavigateAndAuthenticateSalesforce