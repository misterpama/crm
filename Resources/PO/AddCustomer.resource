*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${ADDCUSTOMER_HEADER_LABEL} =       Add Customer
${ADDCUSTOMER_SUBMIT_BOTTOM} =      Submit
${ADDCUSTOMER_EMAIL_TEXTBOX} =      id=EmailAddress
${ADDCUSTOMER_FIRSTNAME_TEXTBOX} =  id=FirstName
${ADDCUSTOMER_LASTNAME_TEXTBOX} =   id=LastName
${ADDCUSTOMER_CITY_TEXTBOX} =       id=City
${ADDCUSTOMER_STATE_DROPDOWN} =     id=StateOrRegion
${ADDCUSTOMER_GENDER_RADIO} =       gender
${ADDCUSTOMER_PROMO_CHECKBOX} =     name=promos-name

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains        ${ADDCUSTOMER_HEADER_LABEL}

Add New Customer
    [Arguments]                     @{new_customer}
    Fill Customer Fields            @{new_customer}
    Click "Submit" Button

Fill Customer Fields
    [Arguments]                     @{new_customer}
    Input Text                      ${ADDCUSTOMER_EMAIL_TEXTBOX}        ${new_customer}[0]
    Input Text                      ${ADDCUSTOMER_FIRSTNAME_TEXTBOX}    ${new_customer}[1]
    Input Text                      ${ADDCUSTOMER_LASTNAME_TEXTBOX}     ${new_customer}[2]
    Input Text                      ${ADDCUSTOMER_CITY_TEXTBOX}         ${new_customer}[3]
    Select From List By Value       ${ADDCUSTOMER_STATE_DROPDOWN}       ${new_customer}[4]
    Select Radio Button             ${ADDCUSTOMER_GENDER_RADIO}         ${new_customer}[5]
    Select Checkbox                 ${ADDCUSTOMER_PROMO_CHECKBOX}

Click "Submit" Button
    Click Button                    ${ADDCUSTOMER_SUBMIT_BOTTOM}