*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Setup     open the browser with Mortgage payment url
Test Teardown    close browser session
Resource        resource.robot


*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Shop_Page_Load}    css:.nav-link


*** Test Cases ***
 Validate Unsuccessful Login
    fill login form    ${username}    ${invalid_password}
    wait until element is located in the page    ${Error_Message_Login}
    verify if error message is correct

Validate cards display in the Shopping Page
    Fill Login Form    ${username}    ${valid_password}
    wait until element is located in the page    ${Shop_Page_Load}


*** Keywords ***
fill login form
    [Arguments]    ${user}    ${password}
    Input Text    id:username    ${user}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

wait until element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify if error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.