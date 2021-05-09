* Settings *
Documentation       Arquivo base do projeto (tudo começa aqui)

Library             Browser
Library             OperatingSystem

Resource            actions/search.robot
Resource            actions/cart.robot
Resource            actions/order.robot

* Variables *
${DEFAULT_TIMEOUT}      10

* Keywords *
Start Session
    New Browser         chromium        False
    # New Browser         ${browser}        ${headless}
    # O segundo parâmetro: False -> é o headless. Vai rodar por debaixo dos panos?
    New Page            http://parodifood.qaninja.academy/
    # Resolução mínima para executar os testes
    Set Viewport Size   1920        1080
    # Checkpoint:
    Get Text            css=span            contains            Nunca foi tão engraçado pedir comida

### Helpers ###
Get JSON
    [Arguments]         ${file_name}

    ${file}         Get File            ${EXECDIR}/resources/fixtures/${file_name}
    # Converter em Super Variável:
    ${super_var}    Evaluate            json.loads($file)           json
    # A keyword Evaluate pega um arquivo json e converte para um formato que o Robot aceita, que no caso é a super variável
    # loads() vai ler o conteúdo da variável $file
    # o segundo parâmetro do Evalute é dizer qual o formato do arquivo, no caso é json. Então vai conseguir pegar o conteúdo da variável file e transformar em uma super variável

    [return]        ${super_var}