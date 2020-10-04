***Settings***
Resource        ../../../resources/services.robot

***Test Cases***
Update Customer
    #cliente origem
    ${payload}=     Get Json        slash.json

    #cadastra o cliente
    Delete Customer         ${payload['cpf']}
    ${resp}=        Post Customer           ${payload}

    #pega o id do cliente
    ${user_id}=     Convert To String       ${resp.json()['id']}

    #muda a massa pra um novo nome
    Set To Dictionary       ${payload}      name        Saul Hudson

    #solicita a alteração na api
    ${resp}         Put Customer    ${payload}      ${user_id}

    Status Should Be        204     ${resp}

    #obtem os dados do cliente para validar se o nome foi alterado
    ${resp}         Get Unique Customer     ${user_id}

    Should Be Equal     ${resp.json()['name']}      Saul Hudson
    