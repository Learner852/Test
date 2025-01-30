# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                        ../Resources/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite

# also when using the Test template only the test case which can implement the test template can be written in this file

*** Test Cases ***
Oppotunity creation and validation
    [Documentation]             This test case is for oppotunity creation and validation
    [Tags]                      testgen    regression
    Appstate                    Home
    LaunchApp                   Sales
    ClickElement                xpath=//a[@title='Opportunities']
    ClickElement                xpath=//div[@title='New']
    TypeText                    *Opportunity Name                FirstOpportunity     anchor=Opportunity Information
    @{lead_source}              GetPickList                 Lead Source               selected=false
    ComboBox                    Lead Source                 Web                       timeout=0    
    TypeText                    Amount                      4513235
    TypeText                    *Close Date                 24/1/2025
    