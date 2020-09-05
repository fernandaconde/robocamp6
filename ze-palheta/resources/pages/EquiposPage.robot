***Settings***
Documentation       Representação da página de equipamentos com seus elementos e ações

***Variables***
${EQUIPOS_FORM}     css:a[href$=register]
${LABEL_EQUIPO_NAME}       css:label[for=equipo-name]
${LABEL_EQUIPO_PRICE}      css:label[for=daily_price]

***Keywords***
Register New Equipo 
    [Arguments]     ${equipo_name}      ${equipo_price}

    Input Text      id:equipo-name              ${equipo_name}
    Input Text      id:daily_price              ${equipo_price} 

    Wait Until Element Is Not Visible   ${TOASTER_SUCCESS}      10

    Click Element   xpath://button[text()='CADASTRAR']