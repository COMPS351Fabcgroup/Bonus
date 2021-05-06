*** Settings ***
Documentation     Class successfully created.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
 Class successfully created
    Open Browser To CREATE YOGA CLASS Page
    Input Name      EASY YOGA CLASS
    Select State    One by One
    Select Centre   Central and West District Centre
    Select Date     20/08/2021
    Input Cost      1200
    Submit
    Create successfully box Should Be Open
    [Teardown]    Close Browser
