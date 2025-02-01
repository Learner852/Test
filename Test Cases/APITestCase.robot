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


*** Keywords ***
Get User Details
    [Documentation]             This test case retrieves user details from the API and verifies the response.
    Create Session              jsonplaceholder             ${BASE_URL}

    ${response}=                Get On Session              jsonplaceholder        /students/1
    Status Should Be            ${response}                 200
    ${response_body}=           Convert To Json             ${response.content}
    Should Be Equal As Strings                              ${response_body.name}                 Myrtle Gibson