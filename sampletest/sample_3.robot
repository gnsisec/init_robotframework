*** Settings ***
Library             Selenium2Library
Suite Setup         Open Browser        ${HOME_URL_LINK}    browser=gc
Suite Teardown      Close Browser
Documentation       This is sample_3.robot

*** Variable ***
${HOME_URL_LINK}        http://www.seleniumeasy.com/test

*** Test Case ***
Testcase One - single checkbox
    [Documentation]         User check a checkbox
    ...                     When checked it
    ...                     User will see message "Success - Check box is checked"
    ...                     And checkbox has been checked
    set selenium speed      .8s

    click link              Input Forms
    click link              Checkbox Demo
    location should be      ${HOME_URL_LINK}/basic-checkbox-demo.html

    Select Checkbox                     id=isAgeSelected

    Wait until element is visible       id=txtAge
    Element Text Should Be              id=txtAge               Success - Check box is checked
    Checkbox Should Be Selected         id=isAgeSelected
