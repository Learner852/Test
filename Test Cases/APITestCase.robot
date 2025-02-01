*** Settings ***
Library        QForce
Library        QWeb
Library        RequestsLibrary
Library        JSONLibrary

*** Variables ***
${name}
${company}
${id}
${BASE_URL}    

*** Keywords ***
Get User Details
    [Documentation]    This test case retrieves user details from the API and verifies the response.
    Create Session    jsonplaceholder    ${BASE_URL}
    ${response}=    Get Request    jsonplaceholder    /users/1
    Status Should Be    ${response}    200
    ${response_body}=    To Json    ${response.content}
    Should Be Equal As Strings    ${response_body.name}    Leanne Graham