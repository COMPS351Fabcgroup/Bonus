*** Settings ***
Documentation     A test suite containing tests related to class cannot be created due to missing field input.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To CREATE YOGA CLASS Page
Suite Teardown    Close Browser
Test Setup        Go To CREATE YOGA CLASS Page
Test Template     Class cannot be created due to missing field input
Resource          resource.robot

*** Test Cases ***                      Name             State                 Centre              Date                Cost
Invalid Username                        invalid          ${VALID State}        ${VALID Centre}     ${VALID Date}       ${VALID Cost}
Invalid State                           ${VALID Name}    invalid               ${VALID Centre}     ${VALID Date}       ${VALID Cost}
Invalid Centre                          ${VALID Name}    ${VALID State}        invalid             ${VALID Date}       ${VALID Cost}
Invalid Date                            ${VALID Name}    ${VALID State}        ${VALID Centre}     invalid             ${VALID Cost}
Invalid Cost                            ${VALID Name}    ${VALID State}        ${VALID Centre}     ${VALID Date}       invalid
Invalid Name,State,Centre,Date,Cost     invalid          invalid               invalid             invalid             invalid
Empty Name                              ${EMPTY}         ${VALID State}        ${VALID Centre}     ${VALID Date}       ${VALID Cost}
Empty State                             ${VALID Name}    ${EMPTY}              ${VALID Centre}     ${VALID Date}       ${VALID Cost}
Empty Centre                            ${VALID Name}    ${VALID State}        ${EMPTY}            ${VALID Date}       ${VALID Cost}
Empty Date                              ${VALID Name}    ${VALID State}        ${VALID Centre}     ${EMPTY}            ${VALID Cost}
Empty Cost                              ${VALID Name}    ${VALID State}        ${VALID Centre}     ${VALID Date}       ${EMPTY}
Empty Name,State,Centre,Date,Cost       ${EMPTY}         ${EMPTY}              ${EMPTY}            ${EMPTY}            ${EMPTY}

*** Keywords ***
 Class cannot be created due to missing field input
    [Arguments]    ${Name}    ${State}    ${Centre}    ${Date}    ${Cost}
    Input Name      ${username}
    Select State    ${password}
    Select Centre   ${Centre}
    Select Date     ${Date}
    Input Cost      ${Cost}
    Submit
    Class create Should be Failed

