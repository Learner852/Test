# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                      ../Resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Library                       DataDriver        reader_class=TestDataApi        name=Book1.csv
Test Template                 AccountCreation
# also when using the Test template only the test case which can implement the test template can be written in this file

*** Test Cases ***
Test Case which will pass its own value 
    [Template]               AccountCreation
    NameAccount              7846513213

*** Keywords ***
AccountCreation
    [Arguments]               ${Account Name}   ${Phone}
    Home
    LaunchApp                 Sales

    ClickText                 Accounts
    ClickUntil                Select a record type         New                 timeout=0
    ClickText                 Next    anchor=Account page for creating volunteer organizations

    TypeText                  *Account Name               ${Account Name}      timeout=0
   

    