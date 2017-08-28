*** Settings ***
Library             Selenium2Library
Suite Setup         Open Browser        ${HOME_URL_LINK}    browser=gc
Suite Teardown      Close Browser
Documentation       This is sample_1.robot

*** Variable ***
${HOME_URL_LINK}        http://www.seleniumeasy.com/test

*** Test Case ***
Testcase One - input form and get the content show in form
    [Documentation]         User input a message in form
    ...                     When user click button
    ...                     User will see his/her message in page
    set selenium speed      .8s

    click link              Input Forms
    click link              Simple Form Demo
    location should be      ${HOME_URL_LINK}/basic-first-form-demo.html

    input text                      id=user-message         千里の道も一歩から
    click button                    jquery=.btn-default:contains("Show Message")

    wait until element is visible   id=display
    element should contain          id=display              千里の道も一歩から
