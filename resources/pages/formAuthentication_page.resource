*** Settings ***
Library        Browser
Library        Collections

*** Keywords ***
Go to form authentication page
    [Arguments]    ${form_auth_link}
    Browser.Click    ${form_auth_link}

Get login credentials
    ${loginCreds}=          Browser.Get Elements    selector=xpath=//em
    ${username}=            Browser.Get Text    ${loginCreds[0]}
    ${password}=            Browser.Get Text    ${loginCreds[1]}
    ${invalid_username}=    Set Variable    invalidUsername
    ${invalid_password}=    Set Variable    WrongPassword123

    ${credentials}=    Create Dictionary
    ...    username=${username}
    ...    password=${password}
    ...    invalidUsername=${invalid_username}
    ...    invalidPassword=${invalid_password}
    RETURN    ${credentials}

Login
    [Arguments]     ${username}    ${password}
    Browser.Fill Text       selector=#username    txt=${username}
    Browser.Fill Secret     selector=#password    secret=$password
    Browser.Click           selector=button[type='submit']

Get message
    ${message}    Browser.Get Text    selector=#flash
    RETURN    ${message}


