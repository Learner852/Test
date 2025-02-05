*** Settings ***
Documentation                   Example resource file with custom keywords. NOTE: Some keywords below may need
...                             minor changes to work in different instances.
Library                         QForce
Library                         String
Library                         JSONLibrary
Library                         FakerLibrary
Library                         Collections

*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${BROWSER}                      chrome
${username}                     saibhargav441@accenture.com
${password}                     Palmeras789%
${login_url}                    https://learndeveloperskills-dev-ed.develop.my.salesforce.com/                      # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     ${login_url}/lightning/page/home
${excel_file}
${test_name}

*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example
    # if you need to use multiple libraries containing keywords with duplicate names
    Set Library Search Order    QForce                      QWeb
    Open Browser                about:blank                 ${BROWSER}
    SetConfig                   LineBreak                   ${EMPTY}                    #\ue000
    Evaluate                    random.seed()               random                      # initialize random generator
    SetConfig                   DefaultTimeout              45s                         #sometimes salesforce is slow
    # adds a delay of 0.3 between keywords. This is helpful in cloud with limited resources.
    SetConfig                   Delay                       0.3

End suite
    Close All Browsers


Login
    [Documentation]             Login to Salesforce instance. Takes instance_url, username and password as
    ...                         arguments. Uses values given in Copado Robotic Testing's variables section by default.
    [Arguments]                 ${sf_instance_url}=${login_url}                         ${sf_username}=${username}                  ${sf_password}=${password}
    GoTo                        ${sf_instance_url}
    TypeText                    Username                    ${sf_username}              delay=1
    TypeSecret                  Password                    ${sf_password}
    ClickText                   Log In
    # We'll check if variable ${secret} is given. If yes, fill the MFA dialog.
    # If not, MFA is not expected.
    # ${secret} is ${None} unless specifically given.
    # ${MFA_needed}=            Run Keyword And Return Status                           Should Not Be Equal         ${None}         ${secret}
    # Run Keyword If            ${MFA_needed}               Fill MFA                    ${sf_username}              ${secret}       ${sf_instance_url}



Fill MFA
    [Documentation]             Gets the MFA OTP code and fills the verification dialog (if needed)
    [Arguments]                 ${sf_username}=${username}                              ${mfa_secret}=${secret}     ${sf_instance_url}=${login_url}
    ${mfa_code}=                GetOTP                      ${sf_username}              ${mfa_secret}               ${login_url}
    TypeSecret                  Verification Code           ${mfa_code}
    ClickText                   Verify


Home
    [Documentation]             Example appstate: Navigate to homepage, login if needed
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                  2
    Run Keyword If              ${login_status}             Login
    ClickText                   Home
    VerifyTitle                 Home | Salesforce

PickTestData
    [Documentation]             This keyword will pick data from the json file and convert it to the usable form
    [Arguments]                 ${test_name}
    ${json_data}=               Load Json From File         ../Test Data/TestData.json
    &{dictionary_data}=         Convert to Dictionary       ${json_data}
    &{test_data}=               Get From Dictionary         dictionary=&{dictionary_data}          key=${test_name}
    Return From Keyword         &{test_data}


NavigateAndAuthenticateSalesforce         
    [Documentation]     authenticate the salesforce
    Login
    LaunchApp           sales
    Authenticate        ${client_id}     ${client_secret}

