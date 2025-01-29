# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource           ../Resources/common.robot
Suite Setup        Setup Browser
Suite Teardown     End suite
Library            DataDriver                  reader_class=TestDataApi    name=Book1.csv
Test Template      accountCreation
# also when using the Test template only the test case which can implement the test template can be written in this file

*** Test Cases ***
Test Case which will pass its own value 
    [Template]     accountCreation
    condalia    7846513213

*** Keywords ***
