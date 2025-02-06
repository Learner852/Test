*** Settings ***
Resource                        ../Resources/common.robot
Test Setup                      Setup Browser
Test Teardown                   End suite


*** Test Cases ***
Create Account Object Records
    [Documentation]                         will create account Records
    [Tags]                                  testgen                     authenticate
    Appstate                                Home
    NavigateAndAuthenticateSalesforce
    ${account_created}                      CreateRecord                            Account        Name=CRT_Account2
    GoTo                                    https://learndeveloperskills-dev-ed.develop.lightning.force.com/lightning/r/Account/${account_created}/view
    ClickElement                            xpath=//a[@id='detailTab__item']
    VerifyField                             Account Name                        CRT_Account2