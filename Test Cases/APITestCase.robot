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
${students_url}                 http://localhost:3000


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
    #${response_body}           Set Variable                ${response.content}
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
    #${data}=                    Create Dictionary           id=11                  name=Pester Gola        school=Bins          username=pester1234 email=pester@hotmail.com
    ${response}                 Get On Session              jsonplaceholder         /students/1              
    Status Should Be            200                         ${response}
    ${response_body}=           Set Variable                ${response.json()}
    Should Be Equal As Strings                              ${response_body['name']}                      Myrtle Gibson


PostLocalStudentsApiTest
    [Documentation]             This will test the post call onto the local students api
    Create Session              jsonplaceholder             ${students_url}
    ${data}=                    Create Dictionary           id=11                  name=Pester Gola        school=Bins          username=pester1234 email=pester@hotmail.com
    ${response}                 Post On Session             jsonplaceholder       /students               json=${data}
    Status Should Be            201                         ${response}
    ${response_body}=           Set Variable                ${response.json()}
    Should Be Equal As Strings                              ${response_body['name']}                      Pester Gola