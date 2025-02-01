*** Settings ***
Library                         QForce
Library                         QWeb
Library                         RequestsLibrary
Library                         JSONLibrary
Library                         JsonValidator

*** Variables ***
${name}
${company}
${id}
${BASE_URL}                     http://localhost:3000/students


*** Test Cases ***

Running the API and validating the response
    [Documentation]             validating API response
    [Tags]                      testgen     API
    

*** Keywords ***
GetStudentDetails
    [Documentation]             This test case retrieves user details from the API and verifies the response.
    Create Session              jsonplaceholder             ${BASE_URL}

    ${response}=                Get On Session              jsonplaceholder        /students/1
    Status Should Be            ${response}                 200
    ${response_body}=           Convert To Json             ${response.content}
    Should Be Equal As Strings                              ${response_body.name}                 Myrtle Gibson