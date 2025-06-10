*** Settings ***
Library        Browser
Library        Collections
Resource       utils${/}browser_management.resource
Resource       pages${/}landing_page.resource
Resource       pages${/}formAuthentication_page.resource
Test Setup   browser_management.Set up browser    headless=False    viewport={"width": 1366, "height": 768}

*** Test Cases ***
Positive Test Case: Successful Login Using Extracted Credentials 
    ${form_auth_link}=   landing_page.Get form authentication link
    formAuthentication_page.Go to form authentication page    ${form_auth_link}
    ${credentials}=    Get login credentials
    VAR    ${username}=    ${credentials}[username]
    VAR    ${password}=    ${credentials}[password]
    BuiltIn.Log Many    ${form_auth_link}    ${username}    ${password}
    formAuthentication_page.Login     ${username}    ${password}
    # wait for the flash message to appear
    ${message}=    formAuthentication_page.Get message
    BuiltIn.Log    Found Message: ${message}
    Should Contain    ${message}    You logged into a secure area!
    Browser.Close Browser

Negative Test Case: Invalid Username
     ${form_auth_link}=   landing_page.Get form authentication link
    formAuthentication_page.Go to form authentication page    ${form_auth_link}
    ${credentials}=    Get login credentials
    VAR    ${username}=    ${credentials}[invalidUsername]
    VAR    ${password}=    ${credentials}[password]
    BuiltIn.Log Many    ${form_auth_link}    ${username}    ${password}
    formAuthentication_page.Login    ${username}    ${password}
    # wait for the flash message to appear
    ${message}=    formAuthentication_page.Get message
    BuiltIn.Log    Invalid Username Message: ${message}
    Should Contain    ${message}    Your username is invalid!
    Browser.Close Browser

Negative Test Case: Invalid Password
     ${form_auth_link}=   landing_page.Get form authentication link
    formAuthentication_page.Go to form authentication page    ${form_auth_link}
    ${credentials}=    Get login credentials
    VAR    ${username}=    ${credentials}[username]
    VAR    ${password}=    ${credentials}[invalidPassword]
    BuiltIn.Log Many    ${form_auth_link}    ${username}    ${password}
    formAuthentication_page.Login    ${username}    ${password}
    # wait for the flash message to appear
    ${message}=    formAuthentication_page.Get message
    BuiltIn.Log    Invalid Password Message: ${message}
    Should Contain    ${message}    Your password is invalid!
    Browser.Close Browser