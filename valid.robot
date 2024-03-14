*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Login-URL}    http://localhost:7272
${Browser}    googlechrome


*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Type in Username   demo
    Type in Password   mode
    Submit Credentials
    Welcome Page should be open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    http://localhost:7272    googlechrome
    Title Should Be    Login Page

Type in Username
    [Arguments]    ${username}
    Input Text    id=username_field    ${username}

Type in Password
    [Arguments]    ${password}
    Input Text    id=password_field    ${password}

Submit Credentials
    Click Button    id=login_button

Welcome Page should be open
    Title Should Be    Welcome Page