*** Settings ***
Documentation           This is a test case to validate the login on Wazoku Community web page
Library     SeleniumLibrary
Resource    ../library/GlobalLibrary.resource
Variables    ../pages/locators/Webelements.py
Test Setup      Start Browser with Wazoku URL
Test Teardown    Close Browser Session
Library     ../library/GlobalLibrary.resource

*** Variables ***

*** Test Cases ***
This is a test case that logs in a valid user to Wazoku Home Page
    [documentation]    Wazoku Test
    [tags]    Regression

    Login to Wazoku     ${username}     ${valid_password}
    Sleep   2
    Go to Discover
    Sleep   2
    Unselect Challenges
    Sleep   2
    Unselect Conversations
    Sleep   2
    Verify Idea Results Generated
    Select First Idea
    Sleep   2
    Verify Idea Window loads correctly
    Close Window


*** Keywords ***

Login to Wazoku
    [Arguments]    ${username}  ${password}
    Wait Until Element is Visible   ${login}
    Click Element   ${login}
    Input Text      ${email_loc}     ${username}
    Input password   ${password_loc}   ${password}
    Click Element   ${submit_button}

Go to Discover
    wait until element is visible    ${discover_loc}
    Click Element   ${discover_loc}

Unselect Challenges
    wait until element is visible    ${challenges_button}
    Click Element   ${challenges_button}

Unselect Conversations
    wait until element is visible    ${conversation_button}
    Click Element   ${conversation_button}

Select First Idea
    wait until element is visible   ${idea}
    Click Element   ${idea}


Verify Idea Results Generated
    ${count} =   get element count    ${result}
    should be true    ${count}>0
    log     ${count} idea(s) found

Verify Maximize Idea Page

    click element    ${view_full}
    capture page screenshot

Verify Idea Window loads correctly
    Verify Maximize Idea Page
    sleep    5
    page should contain     ID
    page should contain element    ${identify}
    page should contain element    ${evaluate}
    page should contain element    ${develop}
    capture page screenshot
    page should contain element    ${complete}
    page should contain element    ${show_details}
    page should contain element     ${creator_image}
    Verify Element Text     ${idea_title}   Collaboration space with key accounts
    Verify Element Text     ${creator_name}  Abigail Anderson
    Verify Element Text     ${description}  Description


