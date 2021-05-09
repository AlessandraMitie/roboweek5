* Settings *
Documentation       Arquivo base do projeto (tudo começa aqui)

Library             Browser

Resource            actions/search.robot

* Keywords *
Start Session
    New Browser         chromium        False
    # O segundo parâmetro: False -> é o headless. Vai rodar por debaixo dos panos?
    New Page            http://parodifood.qaninja.academy/
    # Checkpoint:
    Get Text            css=span            contains            Nunca foi tão engraçado pedir comida