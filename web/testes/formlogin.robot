*** Settings ***
Resource    base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao

*** Test Cases ***

Login com sucesso
    Go To                   ${url}/login
    # buscar elementos pelo tipo e nome, poderia ser por ID, mas vamos complicar
    Input Text              css:input[name=username]        stark
    Input Text              css:input[name=password]        jarvis!
    Click Element           class:btn-login     

    Page Should Contain     Olá, Tony Stark. Você acessou a área logada!


