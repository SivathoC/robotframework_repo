*** Settings ***
Library        Browser
Library        Collections

*** Keywords ***
Get form authentication link
    ${form_auth_link}=    Get Element    selector=xpath=//a[text()='Form Authentication']
    RETURN    ${form_auth_link}

Get file upload link
    ${file_upload_link}=    Get Element    selector=xpath=//a[text()='File Upload']
    RETURN    ${file_upload_link}

Go to dynamic Search page
    ${dynamic_content_link}=    Get Element    selector=xpath=//a[text()='Dynamic Content']
    Browser.Click    ${dynamic_content_link}