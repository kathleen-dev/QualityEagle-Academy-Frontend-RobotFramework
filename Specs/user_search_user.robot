*** Settings ***
Documentation  Essa Suite testa Pesquisa de Usuario cadastrado
Library  SeleniumLibrary
Library  Collections
Resource  ${EXECDIR}/Page/login.robot
Resource  ${EXECDIR}/Page/menus.robot
Resource  ${EXECDIR}/Page/user_search_user.robot
Suite Setup     Open Browser    about:blank     Google Chrome    options=add_argument("disable-search-engine-choice-screen")
Suite Teardown  Close Browser

*** Variables ***
${url}=     https://automacao.qacoders-academy.com.br/login
${BROWSER}    Chrome


*** Test Cases ***
CT01 - Pesquisa Usuario Cadastrado
    [Tags]    CT01
    Fazer Login
    Entrar no menu Cadastros e Usuarios
    Clicar na caixa de Pesquisa
    Digitar nome cadastrado

*** Keywords ***
Fazer Login
    # LOGIN #
    Go To  ${url}
    Wait Until Element Is Visible   ${login.txtEmailUser}   30
    Click Element  ${login.txtEmailUser}
    Input Text   ${login.txtEmailUser}    ${preencherLogin.txtEmailUser}
    Click Element  ${login.txtSenha}
    Input Text  ${login.txtSenha}     ${preencherLogin.txtSenha}
    Click Element  ${login.btnEntrar}
    Wait Until Element Is Visible   ${menu.mnuCadastros}   30

Entrar no menu Cadastros e Usuarios
    Wait Until Element Is Visible   ${menu.mnuCadastros}    30
    Click Element  ${menu.mnuCadastros}
    Wait Until Element Is Visible   ${menu.mnuUsuarios}     30
    Click Element  ${menu.mnuUsuarios}

Clicar na caixa de Pesquisa
    Wait Until Element Is Visible   ${pesquisar.txtPesquisar}     30
    Click Element  ${pesquisar.txtPesquisar}

Digitar nome cadastrado
    Input Text   ${pesquisar.txtPesquisar}    ${dadosPequisa.txtNomeCompleto}
    Sleep    10