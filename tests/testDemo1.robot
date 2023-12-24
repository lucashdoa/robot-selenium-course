*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}        css:.alert-danger

*** Test Cases ***
 Validate Unsuccessful Login
    open the browser with Mortgage payment url
    fill login form
    wait until it checks and displays error message
    verify if error message is correct

*** Keywords ***
open the browser with Mortgage payment url
    Create Webdriver    Chrome    /Users/lucas/Projects/qa/robot-selenium-python/chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/

fill login form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    12345678
    Click Button    id:signInBtn

wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify if error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.