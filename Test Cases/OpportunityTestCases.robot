# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                      ../Resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite
Library                       DataDriver        reader_class=TestDataApi        name=Book1.csv
Test Template                 Accountcreation
# also when using the Test template only the test case which can implement the test template can be written in this file

*** Test Cases ***

Account creation    ${Account Name}   ${Phone}
# Here even if this is removed the test case will be run, as CRT wil implicitely create test case to utilize the data
# onlypoint to remember is that we should define data correctly in the CSV file

Test Case which will pass its own value 
    [Documentation]       this test case uses its own argument to be passed to the Account creation keyword
    NameAccount       

*** keywords ***
Accountcreation
    [Arguments]               ${Account Name}   ${Phone}
    Home
    LaunchApp                 Sales

    ClickText                 Accounts
    ClickUntil                Select a record type         New                 timeout=0
    ClickText                 Next    anchor=Account page for creating volunteer organizations

    TypeText                  *Account Name               ${Account Name}      timeout=0
   

    