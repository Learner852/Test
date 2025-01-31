*** Settings ***
Library        QForce
Library        QWeb
Library        RequestsLibrary

*** Variables ***
${name}
${company}
${id}


*** Keywords ***
APITester
    [Documentation]    This test case creates a new post using the API and verifies the response.
    Create Session    jsonplaceholder    ${BASE_URL}
    ${post_data}=    Create Dictionary    title=foo    body=bar    userId=1
    ${response}=    Post Request    jsonplaceholder    /posts    json=${post_data}
    Status Should Be    ${response}    201
    ${response_body}=    To Json    ${response.content}
    Should Be Equal As Strings    ${response_body.title}    foo
    Should Be Equal As Strings    ${response_body.body}    bar
    Should Be Equal As Numbers    ${response_body.userId}    1