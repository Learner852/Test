#
# Test asset originally created using Copado QEditor.
#

*** Settings ***
Resource                 ../Resources/common.robot

Library                  QWeb

*** Test Cases ***

ExecuteJavascriptTestCase
    [Documentation]      Test Case created using the QEditor
    OpenBrowser          about:blank                 chrome
    GoTo                 https://qentinelqi.github.io/shop/
    VerifyText           your
    VerifyText           Find your spirit animal
    ExecuteJavascript    document.querySelectorAll('ul.product-list li:nth-child(1) .style-picker div')[1].click();