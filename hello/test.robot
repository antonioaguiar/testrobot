*** Settings ***
# importar app.py como uma biblioteca
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    # associar o valor retornado por Welcome a ${result}  ** welcome é um metodo em app.py
    ${result} =         Welcome         Antonio Aguiar
    
    # escrever no log do console
    Log To Console      ${result}    
    
    # comparar valores
    Should Be Equal     ${result}       Olá Antonio Aguiar, Bem vindo ao curto básico de Robot Framework!

