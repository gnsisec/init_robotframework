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

Testcase Two - multiple checkbox
    [Documentation]         User check all checkbox
    ...                     When all checkbox checked
    ...                     The button should change to "Uncheck All"
    ...                     When user Click the "Uncheck All"
    ...                     All checked box should be unselect
    set selenium speed      .8s

    click link              Input Forms
    click link              Checkbox Demo
    location should be      ${HOME_URL_LINK}/basic-checkbox-demo.html

    Select Checkbox         xpath=//label[text()="Option 1"]/descendant::input[@class="cb1-element"]
    Select Checkbox         xpath=//label[text()="Option 2"]/descendant::input[@class="cb1-element"]
    Select Checkbox         xpath=//label[text()="Option 3"]/descendant::input[@class="cb1-element"]
    Select Checkbox         xpath=//label[text()="Option 4"]/descendant::input[@class="cb1-element"]

    # Inspect the button and take a look at value
    # We can click button directly using the value.
    Click Button            Uncheck All

    Checkbox Should Not Be Selected     xpath=//label[text()="Option 1"]/descendant::input[@class="cb1-element"]
    Checkbox Should Not Be Selected     xpath=//label[text()="Option 2"]/descendant::input[@class="cb1-element"]
    Checkbox Should Not Be Selected     xpath=//label[text()="Option 3"]/descendant::input[@class="cb1-element"]
    Checkbox Should Not Be Selected     xpath=//label[text()="Option 4"]/descendant::input[@class="cb1-element"]
