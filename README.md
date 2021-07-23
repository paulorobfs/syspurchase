# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- 2.5.5

* System dependencies


* Configuration


* Database creation
- Criar usuário de acordo com arquivo config/database.yml
- Dar permissão para criação de tabelas ao usuário
- Rodar: rails db:migrate



* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Instalação Dependências do Webpack
 - yarn install

* Inicializar serviço
 - rails s
 
* Requerimentos
The file(1) library and headers are required:

Debian/Ubuntu:: +libmagic-dev+
Fedora/SuSE::   +file-devel+
Gentoo::        +sys-libs/libmagic+
OS X::          <tt>brew install libmagic</tt>



1 - Aceite (via formulário HTML) uploads de arquivos separados por TAB, com as seguintes colunas: nome do comprador, descrição do item, preço do item, contagem de compra, endereço do comerciante, nome do comerciante. 
Você pode presumir que as colunas sempre estarão nessa ordem, que sempre haverá algum valor em cada coluna e que sempre haverá uma linha de cabeçalho. 
Um arquivo de exemplo chamado example_input.tab está incluído neste repo.

2 - Interprete (analise) o arquivo recebido, normalize os dados e salve os dados corretamente em um banco de dados relacional. 
Não se esqueça de modelar as entidades importadas dos dados do arquivo, considerando seus relacionamentos.

3 - Mostra a receita bruta total representada pelos dados de vendas após cada upload de arquivo e também a receita bruta total de todos os tempos.

4 - Ser escrito em Ruby 2.5 ou superior (ou, na linguagem solicitada pela descrição do trabalho, se houver).

5 - Tenha uma boa cobertura de testes automatizados.

6 - Ser simples de configurar e executar, rodando em um ambiente compatível com Unix (Linux ou macOS).

7 - Use apenas linguagem e bibliotecas gratuitas / de código aberto.

Plus***
Lide com a autenticação ou autorização (pontos de bônus se o fizer, especialmente via oAuth).

Ser desenvolvido com qualquer framework específico (mas não há nada de errado em usá-los, use o que você achar melhor para a tarefa).

Seja bonita.