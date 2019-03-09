*** Settings ***
Documentation   Container Test of the Robot Framework DockerLibrary
 ...

Library     OperatingSystem
Library     String

Library     ${EXECDIR}${/}../dockerlibrary/dockerlibrary.py

# Suite Setup
# Suite Teardown
Test Setup  start mongodb
Test Teardown  stop and remove mongodb

Force Tags   container  mongodb


*** Variables ***




*** Test Cases ***
MONGO TEST I
    THIS IS JUST A PLACEHOLDER!

MONGO TEST II
    THIS IS JUST A PLACEHOLDER!

MONGO TEST III
    THIS IS JUST A PLACEHOLDER!



*** Keywords ***
start mongodb
    run mongodb container
    wait until mongodb is ready

stop mongodb
    ${logs}  ${status}  stop mongodb container
    Log  ${status}
    wait until mongodb is stopped
    Should Be Equal As Integers  ${status}[StatusCode]  0

stop and remove mongodb
    stop mongodb
    remove mongodb container

reset mongodb
    stop mongodb
    remove mongodb container
    start mongodb

mongodb is stopped
    ${logs}=  get logs from mongobd
    ${mongo_logs}=  Convert To String    ${logs}
    Should Contain    ${mongo_logs}  [signalProcessingThread] shutting down with code:0

mongodb is ready
    ${logs}=  get logs from mongobd
    ${mongo_logs}=  Convert To String    ${logs}
    Should Contain    ${mongo_logs}    [LogicalSessionCacheRefresh] build index done
    Should Contain    ${mongo_logs}    scanned 0 total records

wait until mongodb is stopped
    Wait Until Keyword Succeeds  10 sec  3 sec  mongodb is stopped

wait until mongodb is ready
    Wait Until Keyword Succeeds  10 sec  3 sec  mongodb is ready

THIS IS JUST A PLACEHOLDER!
    Pass Execution    Robot Rules Test Automation!
    [Teardown]  Set Tags  ROBOT  DOCKER
