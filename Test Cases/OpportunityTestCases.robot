# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                        ../Resources/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite
Library                         DataDriver                  reader_class=TestDataApi    name=Book1.csv
Test Template                   accountCreation
# also when using the Test template only the test case which can implement the test template can be written in this file

*** Test Cases ***
Oppotunity creation and validation
    [Documentation]             This test case is for oppotunity creation and validation
    [Tags]                      testgen    regression
    Appstate                    Home
    LaunchApp                   Sales
    ClickText                   Opportunity
    ClickElement                xpath=//div[@title='New']
    TypeText                    *Opportunity Name                FirstOpportunity     anchor=Opportunity Information
