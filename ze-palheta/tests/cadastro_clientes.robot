***Settings***
Documentation       Cadastro de Clientes

Resource        ../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session


***Test Cases***
Novo Cliente
    [Tags]      smoke
    Dado que acesso o formulário de Cadastro de Clientes
    E que eu tenho o seguinte cliente:
    ...     Bon Jovi            000.000.014-06      Rua dos Bugs, 1000      11999999999
    Quando faço a inclusão desse cliente
    Então devo ver a notificação:   Cliente cadastrado com sucesso!

Cliente duplicado
    [Tags]      duplicado
    Dado que acesso o formulário de Cadastro de Clientes
    E que eu tenho o seguinte cliente:
    ...     Adrian Smith        000.000.141-41      Rua dos Bugs, 2000      11999999998
    Mas esse CPF já existe no sistema
    Quando faço a inclusão desse cliente
    Então devo ver a notificação de erro:   Este CPF já existe no sistema!

Campos Obrigatórios
    Dado que acesso o formulário de Cadastro de Clientes
    E que eu tenho o seguinte cliente:
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Quando faço a inclusão desse cliente
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    ${EMPTY}        34508390222     Rua dos Bugs, 1000      11999999999     Nome é obrigatório

Cpf é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    Fernanda        ${EMPTY}        Rua dos Bugs, 1000      11999999999     CPF é obrigatório

Endereço é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    Fernanda        34508390222     ${EMPTY}      11999999999     Endereço é obrigatório

Telefone é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    Fernanda        34508390222     Rua dos Bugs, 1000      ${EMPTY}     Telefone é obrigatório

Telefone incorreto
    [Template]      Validação de Campos
    João da Silva   00000001406     Rua dos Bugs, 1000      1199999999      Telefone inválido

***Keywords***
Validação de Campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulário de Cadastro de Clientes
    E que eu tenho o seguinte cliente:
    ...     ${nome}    ${cpf}    ${endereco}    ${telefone}
    Quando faço a inclusão desse cliente
    Então devo ver o texto      ${saida}
