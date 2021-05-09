* Settings *

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Session
Test Teardown       Take Screenshot

* Test Cases *
Deve adicionar um item ao carrinho     
# Super variável: recebe um dicionário de dados
# apenas para definir a super variável, deve-se iniciar com & ("e" comercial)
    &{restaurant}       Create Dictionary        restaurant=STARBUGS COFFEE        description=Nada melhor que um café pra te ajudar a resolver um bug.


    Go To Restaurants
    Choose Restaurant       ${restaurant}      
    Add To Cart             Starbugs 500 error
    Should Add To Cart      Starbugs 500 error
    Total Cart Should Be    15,60
    
Deve adicionar 3 itens ao carrinho
    [tags]              temp

    # variável para a massa de teste
    ${cart_json}        Get JSON        cart.json

    Go To Restaurants
    Choose Restaurant       ${cart_json}   

    # percorrer a lista de produtos
    # para o robot entender que a variávl é uma lista, alterar o $ por @
    # cada item do json vai retornar na variável product
    FOR     ${product}      IN      @{cart_json["products"]}   
         Add To Cart                ${product["name"]}
        Should Add To Cart          ${product["name"]}
    END


    Total Cart Should Be    ${cart_json["total"]} 
