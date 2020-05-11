*** Settings ***
Resource    base.robot

Test Setup      Nova sessao
Test Teardown   Encerra sessao

*** Test Cases ***

Login com sucesso
    [tags]                  login_valid
    Enviar Login            stark                           jarvis!      
    #Validar mensagem retorno                                Olá, Tony Stark. Você acessou a área logada!
    Validar nome usuario logado                             Tony Stark

Senha inválida
    [tags]                  login_error
    Enviar Login            stark                           abc123   
    Validar mensagem retorno                                Senha é invalida!
 

Usuário não existe
    [tags]                  user_notfound
    Enviar Login            usuario1                        abc123
    Validar mensagem retorno                                O usuário informado não está cadastrado!


*** Keywords ***    
Enviar Login
    [Arguments]             ${uname}                        ${upass}
    Go To                   ${url}/login
    Input Text              css:input[name=username]        ${uname}
    Input Text              css:input[name=password]        ${upass}
    Click Element           class:btn-login     

Validar mensagem retorno
    [Arguments]             ${umessage}
    ${message}=             Get WebElement                  id:flash
    Should Contain          ${message.text}                 ${umessage}


Validar nome usuario logado
    [Arguments]             ${nome_usuario}
    ${message}=             Get WebElement                  id:flash
    Should Contain          ${message.text}                 Olá, ${nome_usuario}. Você acessou a área logada!