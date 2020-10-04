***Settings***
Documentation       Cadastro de Equipamentos

Resource        ../../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session

***Test Cases***
Novo Equipamento
    Dado que acesso o formulário de Cadastro de Equipamentos
    E que eu tenho o seguinte equipamento:
    ...     Guitarra      60
    Quando faço o cadastro desse equipamento
    Então devo ver a notificação:     Equipo cadastrado com sucesso!

Campos Obrigatórios
    Dado que acesso o formulário de Cadastro de Equipamentos
    E que eu tenho o seguinte equipamento:
    ...     ${EMPTY}      ${EMPTY}
    Quando faço o cadastro desse equipamento
    Então devo ver mensagens de erro informando que os campos de cadastro de equipamentos são Obrigatórios

Nome é obrigatorio
    [Template]      Validação dos Campos
    ${EMPTY}        60              Nome do equipo é obrigatório

Diária é obrigatorio
    [Template]      Validação dos Campos
    Guitarra        ${EMPTY}        Diária do equipo é obrigatória

***Keywords***
Validação dos Campos
    [Arguments]     ${equipo_name}      ${equipo_price}     ${equipo_saida}

    Dado que acesso o formulário de Cadastro de Equipamentos
    E que eu tenho o seguinte equipamento:
    ...     ${equipo_name}      ${equipo_price}
    Quando faço o cadastro desse equipamento
    Então devo ver o texto      ${equipo_saida}