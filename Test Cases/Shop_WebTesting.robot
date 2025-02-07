*** Settings ***
Library    QWeb

*** Test Cases ***
Add to cart and buy the products
    [Documentation]    test case to add the products to the card
    [Tags]             testgen
    GoTo               ${url}