***Settings***
Documentation       Cadastro de Clientes

Resource        ../resources/base.robot

Test Setup      Login Session
Test Teardown   Finish Session


***Test Cases***
Novo Cliente
    Dado que acesso o formulário de Cadastro de Clientes
    Quando faço a inclusão desse Cliente:
    ...     Bon Jovi        000.000.014-06      Rua dos Bugs, 1000      11999999999
    Então devo ver a notificação:   Cliente cadastrado com sucesso!
