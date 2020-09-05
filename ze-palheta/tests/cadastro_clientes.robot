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

Campos Obrigatórios
    Dado que acesso o formulário de Cadastro de Clientes
    Quando faço a inclusão desse Cliente:
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome é Obrigatório
    [tags]          required
    [Template]      Validação de Campos
    ${EMPTY}        34508390222     Rua dos Bugs, 1000      11999999999     Nome é obrigatório

Cpf é Obrigatório
    [tags]          required
    [Template]      Validação de Campos
    Fernanda        ${EMPTY}        Rua dos Bugs, 1000      11999999999     CPF é obrigatório

Endereço é Obrigatório
    [tags]          required
    [Template]      Validação de Campos
    Fernanda        34508390222     ${EMPTY}      11999999999     Endereço é obrigatório

Telefone é Obrigatório
    [tags]          required
    [Template]      Validação de Campos
    Fernanda        34508390222     Rua dos Bugs, 1000      ${EMPTY}     Telefone é obrigatório

***Keywords***
Validação de Campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulário de Cadastro de Clientes
    Quando faço a inclusão desse Cliente:
    ...     ${nome}    ${cpf}    ${endereco}    ${telefone}
    Então devo ver o texto      ${saida}
