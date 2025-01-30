# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                ../Resources/common.robot
Suite Setup             Setup Browser
Suite Teardown          End suite

# also when using the Test template only the test case which can implement the test template can be written in this file

*** Test Cases ***
Oppotunity creation and validation
    [Documentation]     This test case is for oppotunity creation and validation
    [Tags]              testgen                     regression
    Appstate            Home
    LaunchApp           Sales
    ClickElement        xpath=//a[@title='Opportunities']
    ClickElement        xpath=//div[@title='New']
    ${random_number}    Random Number               digits=5                    fix_len=False
    #Opportunity_Name is defined as a variable inside the test lab
    TypeText            *Opportunity Name           ${Opportunity_Name}-${random_number}                    anchor=Opportunity Information
    @{lead_source}      GetPickList                 Lead Source                 selected=false
    PickList            Lead Source                 Web
    TypeText            Amount                      4513235
    TypeText            *Close Date                 24/1/2025
    PickList            *Stage                      Qualified                   timeout=0
    Click Element       xpath=//button[@name='SaveEdit']                        timeout=3
    ClickText           Details
    VerifyField         Opportunity Name            ${Opportunity_Name}-${random_number}                    partial_match=false
    VerifyField         Close Date                  24/1/2025
    VerifyField         Stage                       Qualified
    VerifyField         Lead Source                 Web

Opportunity creation with data from json file and validation
    [Documentation]     This test case is for oppotunity creation and validation
    [Tags]              testgen                     regression
    Appstate            Home
    &{test_data}=       PickTestData                Create opportunity
    LaunchApp           Sales
    ClickElement        xpath=//a[@title='Opportunities']
    ClickElement        xpath=//div[@title='New']
    ${random_number}    Random Number               digits=5                    fix_len=False
    #Opportunity_Name is defined as a variable inside the test lab
    TypeText            *Opportunity Name           ${test_data['Name']}-${random_number}                   anchor=Opportunity Information
    @{lead_source}      GetPickList                 Lead Source                 selected=false
    PickList            Lead Source                 ${test_data['LeadSource']}
    TypeText            Amount                      ${test_data['Amount']}
    TypeText            *Close Date                 ${test_data['StartDate']}
    PickList            *Stage                      ${test_data['Stage']}       timeout=0
    Click Element       xpath=//button[@name='SaveEdit']                        timeout=3
    ClickText           Details
    VerifyField         Opportunity Name            ${test_data['Name']}-${random_number}                    partial_match=false
    VerifyField         Close Date                  ${test_data['StartDate']}
    VerifyField         Stage                       ${test_data['Stage']}
    VerifyField         Lead Source                 ${test_data['LeadSource']}


Space Station creation with data from json file and validation
    [Documentation]     This test case is for space station creation and validation
    [Tags]              testgen                     regression
    Appstate            Home
    &{test_data}=       PickTestData                Create opportunity
    LaunchApp           Sales
    ClickElement        xpath=//a[@title='Opportunities']
    ClickElement        xpath=//div[@title='New']
    ${random_number}    Random Number               digits=5                    fix_len=False
    #Opportunity_Name is defined as a variable inside the test lab
    TypeText            *Opportunity Name           ${test_data['Name']}-${random_number}                   anchor=Opportunity Information
    @{lead_source}      GetPickList                 Lead Source                 selected=false
    PickList            Lead Source                 ${test_data['LeadSource']}
    TypeText            Amount                      ${test_data['Amount']}
    TypeText            *Close Date                 ${test_data['StartDate']}
    PickList            *Stage                      ${test_data['Stage']}       timeout=0
    Click Element       xpath=//button[@name='SaveEdit']                        timeout=3
    ClickText           Details
    VerifyField         Opportunity Name            ${test_data['Name']}-${random_number}                    partial_match=false
    VerifyField         Close Date                  ${test_data['StartDate']}
    VerifyField         Stage                       ${test_data['Stage']}
    VerifyField         Lead Source                 ${test_data['LeadSource']}
