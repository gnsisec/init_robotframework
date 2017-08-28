*** Settings ***
Library             Selenium2Library
Suite Setup         Open Browser        ${HOME_URL_LINK}    browser=gc
Suite Teardown      Close Browser
Documentation       This is suitetest1.robot - click all navigation tab

*** Variable ***
${HOME_URL_LINK}        http://demoqa.com

*** Test Case ***
Testcase One - Click Home Tab
    [Documentation]         User click on Home Tab
    click link              Home
    location should be      ${HOME_URL_LINK}/

Testcase Two - Click About us Tab
    [Documentation]         User click on About us Tab
    click link              About us
    location should be      ${HOME_URL_LINK}/about-us/

Testcase Three - Click Demo > Draggable
    [Documentation]         User click on Demo Tab and click Draggable drop down
    ???
    location should be      ${HOME_URL_LINK}/draggable/

Testcase Four - Click Demo > Tabs
    [Documentation]         User click on Demo Tab and click Tabs drop down
    ???
    location should be      ${HOME_URL_LINK}/tabs/
