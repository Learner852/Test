*** Settings ***
Library                   QWeb

*** Variables ***
${index}=                 1
${NEW_TAB_URL}            www.google.com

*** Test Cases ***
Add to cart and buy the products
    [Documentation]       test case to add the products to the card
    [Tags]                testgen
    OpenBrowser           ${url}                      chrome
    VerifyText            Find your spirit animal
    ${product_count}=      GetElementCount     //li/div[@class\='product-details']
    Execute JavaScript    window.open("about:blank", "_blank");
    #FOR                  ${index}                    IN RANGE    ${index}  ${product_count}
    # ClickItem           xpath=//ul[@*='product-list']/li[${index}]
    #END