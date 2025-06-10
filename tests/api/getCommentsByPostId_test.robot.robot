Give the following file an appropriate name 
*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
${POST_ID}     1      # Example: Fetch comments for post #1
${NEW_POST_DATA}    {"title": "Robot Framework Test", "body": "This is an automated POST test", "userId": 1}

*** Test Cases ***
GET Request - Fetch and Log Comments for a Post
    [Documentation]    Fetches comments for a specific post and logs the first comment's email
    ${response}=    GET    ${BASE_URL}/posts/${POST_ID}/comments
    Should Be Equal As Strings    ${response.status_code}    200
    Log    API Response: ${response.json()}    level=INFO    # Full response (for debugging)
    
    # Extract and log the first comment's email
    ${first_comment_email}=    Get From Dictionary    ${response.json()[0]}    email
    Log To Console    First comment's email: ${first_comment_email}
    Log    <b>First Comment Email:</b> ${first_comment_email}    html=True