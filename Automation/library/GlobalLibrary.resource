*** SETTINGS ***

Library     SeleniumLibrary
Resource    PageFactory.resource


*** Variables ***
${home_page_url}        https://automationtest.wazoku.com/ccc/customer-community
${username}             automation@email.com
${valid_password}       automationUser
${invalid_password}     automationUser1234


*** Keywords ***

Start Browser with Wazoku URL
    Open Browser  ${home_page_url}    chrome
    Maximize Browser Window

Close Browser Session
    Close Browser

Verify Element Text
    [Arguments]    ${locator}  ${text}
    element text should be    ${locator}   ${text}