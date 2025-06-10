*** Settings ***
Library        Browser
Library        Collections

*** Keywords ***
Go to file upload page
    [Arguments]    ${file_upload_link}
    Browser.Click    ${file_upload_link}

File Upload
    [Arguments]    ${filePath}
    Browser.Upload File By Selector    selector=#file-upload    path=${filePath}
    Browser.Click    selector=#file-submit
    Browser.Wait For Elements State    text=File Uploaded!    state=visible
    ${uploadStatus}    Browser.Get Text    selector=xpath=//div[@class='example']/h3
    RETURN    ${uploadStatus}
