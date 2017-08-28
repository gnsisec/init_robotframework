*** Settings ***
Library             Selenium2Library
Suite Setup         Open Browser        ${HOME_URL_LINK}    browser=gc
Suite Teardown      Close Browser
Documentation       This is suitetest2.robot - contact support

*** Variable ***
${HOME_URL_LINK}        http://demoqa.com

*** Test Case ***
Testcase One - contact support (only fill Message)
    [Documentation]         User failed to send a contact form
    ...                     because he/she only fill the Message
    ...                     so user will see "Validation errors occurred."
    #   Open a contact form
    click link              Contact
    location should be      ${HOME_URL_LINK}/contact/

    #   Fill the form and submit it
    input text      name=your-message       進み続けてさえいれば 遅くとも関係ない。
    submit form

    #   User should see "Validation errors occurred."
    wait until element is visible   css=.wpcf7-validation-errors
    element should contain          css=.wpcf7-validation-errors
    ...                             Validation errors occurred.

Testcase Two - contact support (wrong email format)
    [Documentation]         User failed to send a contact form
    ...                     because he/she write invalid email
    ...                     so user will see "Validation errors occurred."
    #   Open a contact form
    ???

    #   Fill the form and submit it
    ???

    #   User should see "Validation errors occurred."
    wait until element is visible   css=.wpcf7-validation-errors
    element should contain          css=.wpcf7-validation-errors
    ...                             Validation errors occurred.

Testcase Three - contact support (success sent the contact form)
    [Documentation]         User success to send a contact form
    ...                     User will see "Your message was sent successfully. Thanks."
    #   Open a contact form
    click link              Contact
    location should be      ${HOME_URL_LINK}/contact/

    #   Fill the form and submit it
    input text      name=your-name          マット
    input text      name=your-email         really@email.com
    input text      name=your-subject       前向きにね。
    input text      name=your-message       進み続けてさえいれば 遅くとも関係ない。
    submit form

    #   User should see "Your message was sent successfully. Thanks."
    ???
