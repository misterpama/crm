*** Settings ***
Documentation       This is some basic info about the whole suite
Resource            ../Resources/Common.resource
Resource            ../Resources/CrmApp.resource
#Resource            ../Resources/CrmGherkin.resource
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Variables ***
${BROWSER} =                        edge
${URL} =                            https://automationplayground.com/crm/
${VALID_LOGIN_EMAIL} =              pippospano@gmail.com
${VALID_LOGIN_PASSWORD} =           pwd
${ADDCUSTOMER_EMAIL_VALUE} =        pippospano@gmail.com
${ADDCUSTOMER_FIRSTNAME_VALUE} =    Pippo
${ADDCUSTOMER_LASTNAME_VALUE} =     Spano
${ADDCUSTOMER_CITY_VALUE} =         Dallas
${ADDCUSTOMER_STATE_VALUE} =        TX
${ADDCUSTOMER_GENDER_VALUE} =       female
@{ADDCUSTOMER_NEW CUSTOMER} =       ${ADDCUSTOMER_EMAIL_VALUE}  ${ADDCUSTOMER_FIRSTNAME_VALUE}  ${ADDCUSTOMER_LASTNAME_VALUE}   ${ADDCUSTOMER_CITY_VALUE}   ${ADDCUSTOMER_STATE_VALUE}  ${ADDCUSTOMER_GENDER_VALUE}

*** Test Cases ***
Home page should load
    [Documentation]         Test the login
    [Tags]                  1001    Smoke   Home
    CrmApp.Go To "Home" Page

Should be able to Login With Valid Credentials
    [Documentation]         Test the login
    [Tags]                  1002    Smoke   Login
    CrmApp.Go To "Home" Page
    CrmApp.Login With Valid Credentials             ${VALID_LOGIN_EMAIL}        ${VALID_LOGIN_PASSWORD}

Should be able to Log Out
    [Documentation]         Test the log out
    [Tags]                      1004    Smoke   Login
    CrmApp.Go To "Home" Page
    CrmApp.Login With Valid Credentials             ${VALID_LOGIN_EMAIL}        ${VALID_LOGIN_PASSWORD}
    CrmApp.Sign Out

Should be able to add new customer
    [Documentation]         Test adding a new customer
    [Tags]                      1006    Smoke   Customers
    CrmApp.Go To "Home" Page
    CrmApp.Login With Valid Credentials             ${VALID_LOGIN_EMAIL}        ${VALID_LOGIN_PASSWORD}
    CrmApp.Add New Customer                         @{ADDCUSTOMER_NEW CUSTOMER}
    CrmApp.Sign Out



#Home_page_should_load
#      [Documentation]       Test the login
#      [Tags]                1001    Smoke   Home
#      [Template]            Home page should load
#            #URL
#            ${URL}
#
#Should_be_able_to_Login_With_Valid_Credentials
#      [Documentation]       Test the login
#      [Tags]                1002    Smoke   Login
#      [Template]            Should be able to Login With Valid Credentials
#            #VALID_LOGIN_EMAIL          #VALID_LOGIN_PASSWORD
#            ${VALID_LOGIN_EMAIL}        ${VALID_LOGIN_PASSWORD}
#
#Should_be able_to_Log_Out
#    [Documentation]         Test the log out
#    [Tags]                  1004    Smoke   Login
#    [Template]              Should be able to Log Out
#            #VALID_LOGIN_EMAIL          #VALID_LOGIN_PASSWORD
#            ${VALID_LOGIN_EMAIL}        ${VALID_LOGIN_PASSWORD}
#
#Should_be_able_to_add_new_customer
#    [Documentation]         Test adding a new customer
#    [Tags]                  1006    Smoke   Customers
#    [Template]              Should be able to add new customer
#            #VALID_LOGIN_EMAIL          #VALID_LOGIN_PASSWORD       #ADDCUSTOMER_NEW CUSTOMER
#            ${VALID_LOGIN_EMAIL}        ${VALID_LOGIN_PASSWORD}     @{ADDCUSTOMER_NEW CUSTOMER}