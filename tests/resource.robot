*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...              SDS
...              sds
Library    SeleniumLibrary

*** Variables ***
${username}        rahulshettyacademy
${invalid_password}        123445
${valid_password}        learning
${url}        https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with Mortgage payment url
    Create Webdriver    Chrome    /Users/lucas/Projects/qa/robot-selenium-python/chromedriver
    Go To    ${url}

close browser session
     Close Browser