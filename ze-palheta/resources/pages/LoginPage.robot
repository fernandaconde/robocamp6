***Settings***
Documentation       Representação da Página Login com suas ações e elementos


***Keywords***
Login With
    [Arguments]     ${email}        ${password}
    
    Input Text      id:txtEmail     ${email}
    Input Text      css:input[placeholder=Senha]        ${password}
    Click Element   xpath://button[text()='Entrar']