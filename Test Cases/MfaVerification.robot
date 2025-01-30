*** Settings ***
Library                 RequestsLibrary
Library                 TwilioLibrary
Suite Setup             Setup Twilio

*** Variables ***
${ACCOUNT_SID}          your_account_sid
${AUTH_TOKEN}           your_auth_token
${FROM_PHONE}           your_twilio_phone_number
${TO_PHONE}             your_phone_number

*** Keywords ***
Setup Twilio
    Create Session      twilio                      https://api.twilio.com
    Set Headers         Content-Type=application/x-www-form-urlencoded

Get OTP from SMS
    [Arguments]         ${to_phone}
    ${response}=        Get Request                 twilio                      /2010-04-01/Accounts/${ACCOUNT_SID}/Messages.json?To=${to_phone}    auth=${ACCOUNT_SID}:${AUTH_TOKEN}
    ${messages}=        Evaluate                    $response.json()['messages']
    FOR                 ${message}                  IN                          @{messages}
        ${body}=        Get From Dictionary         ${message}                  body
        Run Keyword If                              'Your OTP is' in ${body}    Log                         OTP: ${body.split()[-1]}
    END

*** Test Cases ***
Retrieve OTP from SMS
    Get OTP from SMS    ${TO_PHONE}
