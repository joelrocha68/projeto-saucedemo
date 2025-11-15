*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    locators.robot
Resource    ../resources/variables.robot

*** Keywords ***
Open Sauce Login Page
    [Documentation]    Abre o browser e navega até a página de login
    Open Browser    ${SAUCE_URL}    ${BROWSER}    options=add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--remote-debugging-port=9222");add_argument("--disable-gpu");add_argument("--headless=new")
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_USERNAME}    10s

Login As User
    [Documentation]    Realiza login com o usuário e senha
    [Arguments]     ${username}    ${password}
    Input Text      ${INPUT_USERNAME}     ${username}
    Input Text      ${INPUT_PASSWORD}     ${password}
    Click Button    ${BUTTON_LOGIN}
    Wait Until Element Is Visible    ${INVENTORY_LIST}    10s

Add Item By Index
    [Documentation]    Adiciona um produto no carrinho baseado no índice da lista
    [Arguments]    ${index}
    ${btn_inventory}=          Replace String    ${BTN_INVENTORY_BY_INDEX}      {btn_index}     ${index}
    Wait Until Element Is Visible                ${btn_inventory}    5s
    ${item_name_locator}=      Replace String    ${INVENTORY_ITEM_BY_INDEX}     {item_index}    ${index}
    ${item_name}=              Get Text          ${item_name_locator}
    Click Element              ${btn_inventory}
    RETURN                     ${item_name}

Remove Item By Name
    [Documentation]    Remove um produto do carrinho pelo nome
    [Arguments]    ${item}
    ${inventory_remove_btn}=    Replace String    ${BTN_REMOVE_INVENTORY_ITEM_BY_NAME}    {inventory_item}    ${item}
    Click Element    ${inventory_remove_btn}

Go To Cart
    [Documentation]    Acessa o carrinho de compras
    Click Element                    ${CART_ICON}
    Wait Until Element Is Visible    ${CART_LIST}    5s

Checkout Complete Order
    [Documentation]    Realiza o fluxo de checkout com dados do usuário
    Click Button                     ${CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_INFO}       10s
    Input Text                       ${FIRST_NAME}          Test
    Input Text                       ${LAST_NAME}           User
    Input Text                       ${POSTAL_CODE}         00000000
    Click Button                     ${CONTINUE_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_SUMMARY}    5s
    Click Button                     ${FINISH_BUTTON}
    Wait Until Element Is Visible    ${CHECKOUT_COMPLETED}    10s
    Capture Page Screenshot          Checkout_Completed_${TEST NAME}.png

Cart Should Be Empty
    [Documentation]    Verifica que o carrinho está vazio
    ${items}=    Get Element Count    ${CART_ITEM}
    Should Be Equal As Integers       ${items}    0
