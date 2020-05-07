*** Settings ***
Resource    base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao

*** Test Cases ***

Validar o Titulo da Página
    Title Should Be     Training Wheels Protocol

