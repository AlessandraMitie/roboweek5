* Settings *
Library         Browser

* Test Cases *
Buscar um restaurante
    New Browser         chromium        False
    # O segundo parâmetro: False -> é o headless. Vai rodar por debaixo dos panos?
    New Page            http://parodifood.qaninja.academy/
    # Checkpoint:
    Get Text            css=span            contains            Nunca foi tão engraçado pedir comida
    
    Click               text=Estou com fome!
    Get Text            css=h1 strong      contains            Ta na hora de matar a fome!
   
    Click               css=.search-link
    Fill Text           css=input[formcontrolname="searchControl"]              Debuger

    Wait For Elements State         css=.place-info-box         visible         10
    Get Text            css=.place-info-box         contains            DEBUGER KING

    # thinking time
    Sleep               1
    Take Screenshot