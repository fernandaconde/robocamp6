***Settings***
Documentation       Exclusão de Clientes

Resource            ../resources/base.robot

Suite Setup         Login Session
Suite Teardown      Finish Session


***Test Cases***
Remover Cliente
    Dado que eu tenho um cliente indesejado:
    ...     Fernanda Nogueira       000.222.346-44     Rua dos Bugs, 2000      21988888888
    E acesso a lista de clientes
    Quando eu removo o cliente
    Então devo ver a notificação:  Cliente removido com sucesso!

***Keywords***
Dado que eu tenho um cliente indesejado:
    [Arguments]         ${name}     ${cpf}      ${address}      ${phone_number}
    Remove Customer By Cpf          ${cpf}

    Insert Customer     ${name}     ${cpf}      ${address}      ${phone_number}

E acesso a lista de clientes
    Go To Customers

Quando eu removo o cliente
    Wait Until Element is Visible       xpath://td[text()='000.222.346-44']     5
    Click Element                       xpath://td[text()='000.222.346-44']

    Wait Until Element is Visible       xpath://button[text()='APAGAR']         5
    Click Element                       xpath://button[text()='APAGAR']