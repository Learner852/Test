*** Settings ***
Library    QWeb

*** Variables ***
${index}

*** Test Cases ***
Add to cart and buy the products
    [Documentation]    test case to add the products to the card
    [Tags]             testgen
    OpenBrowser        ${url}    chrome
    VerifyText         Find your spirit animal
    ClickItem          xpath=//ul[@*='product-list']/li[1]