*** Settings ***
Library    QWeb

*** Variables ***
${index}=    1

*** Test Cases ***
Add to cart and buy the products
    [Documentation]    test case to add the products to the card
    [Tags]             testgen
    OpenBrowser        ${url}    chrome
    VerifyText         Find your spirit animal
    ${product_count}   Get Count          products    product-list
    Log                ${product_count}
    #FOR   ${index}     IN RANGE   ${index}  
    # ClickItem          xpath=//ul[@*='product-list']/li[${index}]   
    #END