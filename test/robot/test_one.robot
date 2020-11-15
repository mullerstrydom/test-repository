*** Settings ***
Library  Process
Library  Selenium2Library
#Resource                 ...${/}resources${/}common.robot
#Test Teardown            Close Application

*** Variables ***
${NAME}                  John Doe
${INPUT_NAME_FIELD}      id=com.bitbar.testdroid:id/editText1
${INPUT_SURNAME_FIELD}   id=com.bitbar.testdroid:id/editText1
${WEB_SERVER_HANDLE}     none

${web_address}           http://localhost:4444/test1.html
${browser}               Firefox
${user_name}             Test_username
${user_surname}          Test_usersurname


*** Keywords ***
Start python webserver
    [Documentation]  Starts a webserver to test web pages
    ${WEB_SERVER_HANDLE} =  Start Process  python-server.py
    Process Should Be Running  ${WEB_SERVER_HANDLE}  error_message=Webserver is not running
    ${pid} =  Get Process Id  ${WEB_SERVER_HANDLE}

Stop python webserver
    [Documentation]  Stops the webserver
    ${stopped_pid} =  Get Process Id  ${WEB_SERVER_HANDLE}
    Terminate Process   ${WEB_SERVER_HANDLE}
    Process Should be Stopped  ${WEB_SERVER_HANDLE}

*** Test Cases ***
Fill Form
    [Setup]  Start python webserver
    Open Browser     ${web_address}  ${browser}
    Input Text       input-name      ${user_name}
    Input Text       input-surname   ${user_surname}
    ${confirm_un} =  Get Value       input-name
    ${confirm_sn} =  Get Value       input-surname
    Should be equal  ${confirm_un}   ${user_name}
    Should be equal  ${confirm_sn}   ${user_surname}
    Close Browser
    [Teardown]  Stop python webserver
