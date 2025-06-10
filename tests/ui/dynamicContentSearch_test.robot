*** Settings ***
Library        Browser
Library        Collections
Library        String
Library        OperatingSystem
Resource       utils${/}browser_management.resource
Resource       pages${/}landing_page.resource
Test Setup     browser_management.Set up browser    headless=False    viewport={"width": 1366, "height": 768}

*** Variables ***
${SEARCH_TEXT}    Quia
${MAX_REQUIRED}    3
${SCREENSHOT_DIR}    ${OUTPUT_DIR}${/}screenshots

*** Test Cases ***
Search Word Until Found 3 Times
    [Documentation]    Searches for text until it's found 3 times across page reloads
    Create Directory    ${SCREENSHOT_DIR}
   landing_page.Go to dynamic Search page
    
    ${FOUND_COUNT}=    Set Variable    0
    ${RELOAD_COUNT}=    Set Variable    0
    
    WHILE    ${FOUND_COUNT} < ${MAX_REQUIRED}
        ${elements}=    Get Elements    selector=*.large-10
        ${found}=    Count Occurrences In Elements    ${elements}    ${SEARCH_TEXT}
        ${FOUND_COUNT}=    Evaluate    ${FOUND_COUNT} + ${found}
        ${RELOAD_COUNT}=    Evaluate    ${RELOAD_COUNT} + 1

        IF    ${found} > 0
            ${screenshot_path}=    Set Variable    ${SCREENSHOT_DIR}${/}found_${RELOAD_COUNT}.png
            Take Screenshot    filename=${screenshot_path}    fullPage=True
            Log To Console    Found "${SEARCH_TEXT}" ${found} time(s) on reload ${RELOAD_COUNT}
            
            # Create HTML log entry
            ${html}=    Set Variable    <p>Found "${SEARCH_TEXT}" ${found} time(s) on reload ${RELOAD_COUNT}</p><img src="${screenshot_path}" width="800px">
            Log    ${html}    html=True
        END

        IF    ${FOUND_COUNT} < ${MAX_REQUIRED}
            Sleep    1s
            Reload
        END
    END

    Log To Console    Search term "${SEARCH_TEXT}" found ${FOUND_COUNT} times after ${RELOAD_COUNT} reload(s).
    Close Browser

*** Keywords ***
Count Occurrences In Elements
    [Arguments]    ${elements}    ${search_term}
    ${total_count}=    Set Variable    0
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        ${count}=    Evaluate    """${text}""".count("""${search_term}""")
        ${total_count}=    Evaluate    ${total_count} + ${count}
    END
    RETURN    ${total_count}