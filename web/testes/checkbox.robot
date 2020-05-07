*** Settings ***
Resource    base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao

*** Variables ***
${check_thor}                       id:thor
${check_ironman}                    css:input[value='iron-man']
${check_pantera}                    xpath://*[@id='checkboxes']/input[7]
*** Test Cases ***

Marcando opção com id
    [tags]                          thor
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_thor}  
    Checkbox Should Be Selected     ${check_thor}  

Marcando opção com CSS Selector
    [tags]                          ironman
    Go To                           ${url}/checkboxes
    Select checkbox                 ${check_ironman} 
    Checkbox Should Be Selected     ${check_ironman} 

Marcando opção com XPATH
    [tags]                          pantera    
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_pantera}
    Checkbox Should Be Selected     ${check_pantera}
    Sleep                           5 