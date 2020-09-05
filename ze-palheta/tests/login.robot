***Settings***
Documentation   Login

Resource        ../resources/base.robot

Suite Setup      Start Session
Suite Teardown   Finish Session

***Test Cases***
Login do Administrador
    Acesso a página Login
    Submeto minhas credenciais  admin@zepalheta.com.br  pwd123
    Devo ver a área logada
