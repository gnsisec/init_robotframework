*** Settings ***
Library             Selenium2Library
Suite Setup         Open Browser        ${HOME_URL_LINK}    browser=gc
Suite Teardown      Close Browser
Documentation       This is sample_2.robot

*** Variable ***
${HOME_URL_LINK}        http://www.seleniumeasy.com/test
${num1}                 26
${num2}                 19

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

    input text              id=sum1                         ${num1}     # look at the value in variable section
    input text              id=sum2                         ${num2}     # look at the value in variable section
    click button            jquery=.btn-default:contains("Get Total")
    ${total}                evaluate                        ${num1}+${num2}
    ${total}                Convert To String               ${total}

    wait until element is visible   id=displayvalue
    element should contain          id=displayvalue         ${total}
