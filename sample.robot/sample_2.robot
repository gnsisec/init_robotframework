*** Settings ***
Library             Selenium2Library
Suite Setup         Open Browser        ${HOME_URL_LINK}    browser=gc
Suite Teardown      Close Browser
Documentation       This is sample_2.robot

*** Variable ***
${HOME_URL_LINK}        http://www.seleniumeasy.com/test
${sum1}                 1
${sum2}                 1

*** Test Case ***
Testcase One - input two number and add that number
    [Documentation]         User input 2 number
    ...                     When user click button
    ...                     User will see result = number 1 + number 2
    set selenium speed      .8s

    click link              Input Forms
    click link              Simple Form Demo
    location should be      ${HOME_URL_LINK}/basic-first-form-demo.html

    input text                      id=sum1         6
    input text                      id=sum2         9
    click button                    jquery=.btn-default:contains("Get Total")

    wait until element is visible   id=displayvalue
    element should contain          id=displayvalue         15

Testcase Two - input two number and add that number (play with variable)
    [Documentation]         User input 2 number
    ...                     When user click button
    ...                     User will see result = number 1 + number 2
    set selenium speed      .8s

    click link              Input Forms
    click link              Simple Form Demo
    location should be      ${HOME_URL_LINK}/basic-first-form-demo.html

    input text              id=sum1                         ${sum1}
    input text              id=sum2                         ${sum2}
    click button            jquery=.btn-default:contains("Get Total")
    ${total}                evaluate                        ${sum1}+${sum2}
    ${total}                Convert To String               ${total}

    wait until element is visible   id=displayvalue
    element should contain          id=displayvalue         ${total}
