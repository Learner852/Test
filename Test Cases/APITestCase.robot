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
${BASE_URL}                     https://reqres.in/


*** Test Cases ***

Running the API and validating the response
    [Documentation]             validating API response
    [Tags]                      testgen     API
    GetStudentDetails

*** Keywords ***
GetStudentDetails
    [Documentation]             This test case retrieves user details from the API and verifies the response.
    Create Session              jsonplaceholder             ${BASE_URL}

    ${response}=                Get On Session              jsonplaceholder        api/users/2
    Status Should Be            200                         ${response}                 
    ${response_body}=           Evaluate                    json.loads(${response.content})               json
    #${response_body}            Set Variable                ${response.content}
    Should Be Equal As Strings                              ${response_body.first_name}                 Myrtle Gibson