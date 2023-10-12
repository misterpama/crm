*** Settings ***
Resource        PO/AddCustomer.resource
Resource        PO/Customers.resource
Resource        PO/Home.resource
Resource        PO/LoggedOut.resource
Resource        PO/SignIn.resource
Resource        PO/TopNav.resource

*** Variables ***

*** Keywords ***
Go To "Home" Page
#    [Arguments]                                     ${Url}
#    Home.Navigate To                                ${Url}
    Home.Navigate To
    Home.Verify Page Loaded

Login With Valid Credentials
    [Arguments]                                     ${EMail}        ${Password}
    TopNav.Click "Sign In" Link
    SignIn.Verify Page Loaded
    SignIn.Login With Valid Credentials             ${EMail}        ${Password}
    Customers.Verify Page Loaded

Add New Customer
    [Arguments]                                     @{New Customer}
    Customers.Click Add Customer Link
    AddCustomer.Verify Page Loaded
    AddCustomer.Add New Customer                    @{New Customer}
    Customers.Verify Customer Added Successfully

Sign Out
    TopNav.Click "Sign Out" Link
    LoggedOut.Verify Page Loaded