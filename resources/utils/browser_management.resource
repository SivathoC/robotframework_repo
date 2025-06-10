*** Settings ***
Library    Browser

*** Keywords ***
Set up browser
    [Arguments]    ${browser}=chromium    ${headless}=true    ${slowMo}=0:00:05
    ...        ${viewport}={"width": 1366, "height": 768}    ${url}=https://the-internet.herokuapp.com/
    Browser.New Browser    browser=${browser}    headless=${headless}    slowMo=${slowMo}
    Browser.New Context    viewport=${viewport}
    Browser.New Page    url=https://the-internet.herokuapp.com/
    