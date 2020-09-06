***Settings***
Documentation       Exclusão de Clientes

Resource            ../resources/base.robot

Suite Setup         Login Session
Suite Teardown      Finish Session


***Test Cases***
Remover Cliente
    Dado que eu tenho um cliente indesejado:
    ...     Bob Dylan       33333333333     Rua dos Bugs, 2000      21988888888
    E acesso a lista de clientes
    Quando eu removo o cliente
    Então devo ver a notificação:  Cliente removido com sucesso!
    E esse cliente não deve aparecer na lista
