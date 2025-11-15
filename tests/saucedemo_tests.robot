*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          ../resources/saucedemo_keywords.robot

Test Teardown    Close Browser

*** Test Cases ***
Cenário 1: Fluxo de compra de usuário padrão standard_user
    [Documentation]    Faça login como usuário standard_user, adicione produtos, remova o primeiro adicionado e finalize o pedido.
    Open Sauce Login Page
    Login As User    ${STANDARD_USER}    ${PASSWORD}
    ${item1}=    Add Item By Index    2
    ${item2}=    Add Item By Index    3
    Remove Item By Name    ${item1}
    Go To Cart
    Checkout Complete Order

Cenário 2: Fluxo de compra do usuário performance_glitch_user
    [Documentation]    Faça login como usuário performance_glitch_user, adicione produtos, remova o primeiro adicionado e finalize o pedido.
    Open Sauce Login Page
    Login As User    ${PERFORMANCE_USER}    ${PASSWORD}
    ${item1}=    Add Item By Index    2
    ${item2}=    Add Item By Index    4
    Remove Item By Name    ${item1}
    Go To Cart
    Checkout Complete Order

Cenário 3: Usuários standard_user tenta finalizar a compra com o carrinho vazio.
    [Documentation]    Faça Login como usuário standard_user, acessar carrinho e tentar finalizar pedido com carrinho vazio
    Open Sauce Login Page
    Login As User    ${STANDARD_USER}    ${PASSWORD}
    Go To Cart
    Cart Should Be Empty
    Checkout Complete Order