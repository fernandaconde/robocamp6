***Settings***
Documentation       Palavras Chaves do Projeto

***Keywords***
# Login
Acesso a página Login
    Go To           ${base_url}

Submeto minhas credenciais
    [Arguments]     ${email}    ${password}

    Login With      ${email}    ${password}

Devo ver a área logada
    Wait Until Page Contains        Aluguéis        5

Devo ver um toaster com a mensagem
    [Arguments]     ${expect_message}

    Wait Until Element Contains         ${TOASTER_ERROR_P}       ${expect_message}    5

# Customers
Dado que acesso o formulário de Cadastro de Clientes
    Go To Customers 
    Wait Until Element is Visible       ${CUSTOMERS_FORM}     5
    Click Element                       ${CUSTOMERS_FORM}

E que eu tenho o seguinte cliente:
    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Remove Customer By Cpf      ${cpf}

    Set Test Variable           ${name}
    Set Test Variable           ${cpf}
    Set Test Variable           ${address}
    Set Test Variable           ${phone_number}

Mas esse CPF já existe no sistema
    Insert Customer             ${name}     ${cpf}      ${address}      ${phone_number}

Quando faço a inclusão desse cliente
    Register New Customer       ${name}  ${cpf}  ${address}  ${phone_number}

Então devo ver a notificação:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCCESS}      ${expect_notice}    5

Então devo ver a notificação de erro:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_ERROR}        ${expect_notice}    5

Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios
    Wait Until Element Contains     ${LABEL_NAME}                   Nome é obrigatório          5
    Wait Until Element Contains     ${LABEL_CPF}                    CPF é obrigatório           5
    Wait Until Element Contains     ${LABEL_ADDRESS}                Endereço é obrigatório      5
    Wait Until Element Contains     ${LABEL_PHONE_NUMBER}           Telefone é obrigatório      5

Então devo ver o texto
    [Arguments]     ${expect_text}

    Wait Until Page Contains        ${expect_text}      5

# Equipos
Dado que acesso o formulário de Cadastro de Equipamentos
    Wait Until Element is Visible       ${NAV_EQUIPOS}      5
    Click Element                       ${NAV_EQUIPOS}
    Wait Until Element is Visible       ${EQUIPOS_FORM}     5
    Click Element                       ${EQUIPOS_FORM}

E que eu tenho o seguinte equipamento:
    [Arguments]     ${equipo_name}      ${equipo_price}

    Set Test Variable       ${equipo_name}
    Set Test Variable       ${equipo_price}

Quando faço o cadastro desse equipamento
    Register New Equipo     ${equipo_name}        ${equipo_price}

Então devo ver mensagens de erro informando que os campos de cadastro de equipamentos são Obrigatórios
    Wait Until Element Contains     ${LABEL_EQUIPO_NAME}       Nome do equipo é obrigatório         5
    Wait Until Element Contains     ${LABEL_EQUIPO_PRICE}      Diária do equipo é obrigatória       5