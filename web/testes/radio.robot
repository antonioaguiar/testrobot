*** Settings ***
Resource    base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao

*** Test Cases ***

Selecionar por ID
    [tags]                          cap
    Go To                           ${url}/radios
    #                               elemento pelo nome      id a marcar
    Select Radio Button             movies                  cap                    
    Radio Button Should Be Set To   movies                  cap  
    

Selecionar por Value
    [tags]                          guardians
    Go To                           ${url}/radios
    Select Radio Button             movies                  guardians
    Radio Button Should Be Set To   movies                  guardians
       