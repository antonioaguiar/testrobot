*** Settings ***
Documentation     Sendo um APP cliente (mobile, web) que recebeu os dados do usuário
...               Quero solicitar requisições POST para o serviço /auth 
...               Para que o sistema possa avaliar se o usuário possui acesso.

Library           RequestsLibrary
Library           Collections

*** Test Cases ***
#Desenvolvimento guiado por comportamento (TDD)
Autorizando o usuário
    Dado que o usuário submeteu suas credenciais de acesso:
    ...     antonioaguiar@gmail.com             hahaha
    Quando eu faço uma requisição POST para o serviço / auth
    Então o código de status deve ser           200
    E a mensagem na resposta igual a            Tudo certo, você foi autenticado!


Senha do usuário inválida
    Dado que o usuário submeteu suas credenciais de acesso:
    ...     antonioaguiar@gmail.com             kkkkkk
    Quando eu faço uma requisição POST para o serviço / auth
    Então o código de status deve ser           401
     

*** Keywords ***
Dado que o usuário submeteu suas credenciais de acesso:
    [Arguments]     ${email}       ${password}

    #montar json para envio via post, usando dictonary
    &{payload}=     Create Dictionary       email=${email}      password=${password}
    Set Test Variable   ${payload}

Quando eu faço uma requisição POST para o serviço / auth
    Create Session      api             http://localhost:3000
    #     
    ${resp}=            Post Request    api     /auth    json=${payload}
    Set Test Variable   ${resp}

Então o código de status deve ser
    [Arguments]         ${expect-code}
    Status Should Be    ${expect-code}      ${resp}

E a mensagem na resposta igual a 
    [Arguments]         ${expect-message}
    #Log                 ${resp.text}
    Should Be Equal     ${resp.json()['msg']}               ${expect-message}
