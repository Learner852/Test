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
${students_url}                 http://localhost:3000/
${gorest_url}                   https://gorest.co.in
${TOKEN}                        efe64d6bb6d69d69594d555b5eba35a79a032dfcae66e1f10ded8e61fc40551b


*** Test Cases ***

Running the API and validating the response
    [Documentation]             validating API response
    [Tags]                      testgen                     API
    GetUserDetails
    PostUserDetails
    GetLocalStudentsApiTest
    PostLocalStudentsApiTest

*** Keywords ***
GetUserDetails
    [Documentation]             This test case retrieves user details from the API and verifies the response.
    Create Session              jsonplaceholder             ${BASE_URL}

    ${response}=                Get On Session              jsonplaceholder       api/users/2
    Log To Console              $response
    Status Should Be            200                         ${response}
    ${response_body}=           Set Variable                ${response.json()}
    Should Be Equal As Strings                              ${response_body['data']['first_name']}        Janet

PostUserDetails
    [Documentation]             This test case makes a post call to the BASE_URL
    [Tags]                      APItesting
    Create Session              jsonplaceholder             ${BASE_URL}
    ${data}=                    Create Dictionary           id=7                  email=pester@gma.com    first_name=perter    last_name=kumar
    ${response}=                Post On Session             jsonplaceholder       api/users/?page\=1      json=${data}
    Status Should Be            201                         ${response}
    ${response_body}=           Set Variable                ${response.json()}
    Should Be Equal As Strings                              ${response_body['first_name']}                perter


GetLocalStudentsApiTest
    [Documentation]             This will test the post call onto the local students api
    Create Session              jsonplaceholder             ${students_url}
    ${response}                 Get On Session              jsonplaceholder       students/1
    Status Should Be            200                         ${response}
    ${response_body}=           Set Variable                ${response.json()}
    Should Be Equal As Strings                              ${response_body['name']}                      Myrtle Gibson

GetRequestToAPIwithToken
    [Documentation]             gorest api with AUTH_TOKEN
    Create Session              gorest                       ${gorest_url}           headers={"Authorization":"Bearer ${TOKEN}"}
    ${response}                 Get On Session               gorest                  /public/v2/users
    Status Should Be            200                          ${response}
    ${response_body}            Set Variable                 ${response.json()}
    Log                        ${response_body}