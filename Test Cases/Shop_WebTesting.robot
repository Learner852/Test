*** Settings ***
Library                   QWeb
Library                   Collections

*** Variables ***
${index}=                 1
${NEW_TAB_URL}            www.google.com

*** Test Cases ***
Add to cart and buy the products
    [Documentation]       test case to add the products to the card
    [Tags]                testgen
    OpenBrowser           ${url}                      chrome
    VerifyText            Find your spirit animal
    ${product_count}=     GetElementCount             //li/div[@class\='product-details']
    Execute JavaScript    window.open("about:blank", "_blank");
    SwitchWindow          1
    ${product_list}=      Create List
    FOR                   ${index}                    IN RANGE                    1    ${product_count}+1
        ClickElement      (//li/div[@class\='product-details'])[${index}]/h4/a
        Sleep             2s
        ${product_name}=   GetText                    //div[@class\='text-container']/h2    
        Append To List    ${product_list}             ${product_name}
        ClickText         Add to cart
        ClickText         Continue shopping           anchor=Cart summary
        Sleep             2s
        clicktext         Products                    anchor=General
    END
    Log List              ${product_list}
    ClickElement          xpath=//*[.\='shopping_cart']
    Set Variable          ${index}                    1            
    FOR    ${index}    IN    1    ${product_count}
        ${temp}        Get From List                  ${product_list}    ${index}
    END        