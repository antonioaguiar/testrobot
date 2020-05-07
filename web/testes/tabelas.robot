*** Settings ***
Resource    base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao

*** Test Cases ***

Verificar o valor ao informar numero da linha
    Go To                           ${url}/tables

    #                               tabela          linha       valor  
    Table Row Should Contain        id=actors       1           $ 10.000.000
    Table Row Should Contain        id=actors       1           @robertdowneyjr
    

Descobre a linha pelo texto chave e valida os demais valores
    Go To                                           ${url}/tables

    ${target}           Get WebElement              xpath:.//tr[contains(.,'@prattprattpratt')]
    Log                 ${target.text}
    Log To Console      ${target.text}
    Should Contain      ${target.text}              10.000.000
    Should Contain      ${target.text}              Chris Pratt