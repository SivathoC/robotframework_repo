*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}          https://jsonplaceholder.typicode.com
${POST_ID}           1
${NEW_POST_DATA}     {"title": "Robot Framework Test", "body": "This is an automated POST test", "userId": 1}

*** Test Cases ***
POST Request - Create a New Post and Log ID
    [Documentation]    Creates a new post and logs the returned ID
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST    ${BASE_URL}/posts    data=${NEW_POST_DATA}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    Log    API Response: ${response.json()}    level=INFO
    
    ${new_post_id}=    Get From Dictionary    ${response.json()}    id
    Log To Console    New Post ID: ${new_post_id}
    Log    <b>New Post ID:</b> ${new_post_id}    html=True
