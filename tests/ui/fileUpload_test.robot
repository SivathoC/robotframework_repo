*** Settings ***
Library        Browser
Library        Collections
Resource       utils${/}browser_management.resource
Resource      pages${/}landing_page.resource
Resource       pages${/}fileUpload_page.resource
Test Setup     browser_management.Set up browser    headless=False    viewport={"width": 1366, "height": 768}

*** Variables ***
${fileName}    Robot framework Assessment.pdf
${filePath}    C:\\Users\\sivat\\Downloads\\${fileName}

*** Test Cases ***
Test File Upload
    ${file_upload_link}    landing_page.Get file upload link
    fileUpload_page.Go to file upload page    ${file_upload_link}
    ${uploadStatus}    fileUpload_page.File Upload    ${filePath}
    Should Contain    ${uploadStatus}    File Uploaded!  
    Browser.Close Browser
