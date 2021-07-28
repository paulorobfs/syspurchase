# README

Esta documentação é sobre o sistema SysPurchase.
O SysPurchase é um sistema que visa cadastrar Lojas, Itens das Lojas, Vendas e Usuários.
No mesmo poderá ser realizado um upload de um arquivo txt separado por tabulação com todas essas informações onde o sistema processará e 
cadastrará tudo automaticamente.
Também podem ser realizados cadastros, alterações e exclusão de forma manual através do site caso o usuário tenha perfil de Administrador.

Things you may want to cover:

* Ruby version
- 2.5.5

* Rails version
 - 6.0.4

* Database creation
- Criar usuário do banco de dados de acordo com arquivo config/database.yml
- Dar permissão para criação de tabelas ao usuário
- Rodar: rails db:migrate

* Instalação Dependências do Webpack
 - yarn install

* Inicializar serviço
 - rails s
 
* Tests
 - Está implementado uma cobertura parcial de testes unitários com os modelos e de requisições
 - Foi utilizado para geração de dados de alguns dos testes a gem Faker que gera dados aleatórios
 - Foi também adicionado testes de permissão permissão utilizando o Devise e autorização utilizando o CANCANCAN
 - Gems utilizadas para teste: rspec, factory bot, capybara e faker.

 * Estilos
 - O projeto utiliza o Bootstrap 5 e FontAwsome para os ícones

 * Acesso de usuários
 - Tanto o usuário poderá se cadastrar utilizando OAUTH via Google e Facebook como através do próprio site
 - Ao rodar os migrations será gerado um usuário administrador onde o mesmo pode ter acesso total ao sistema
 - Os usuários que irão se cadastrar pelo site ou via Oauth receberão apenas acesso de leitura
 - Gems utilizadas: devise, cancancan, omniauth, omniauth-facebook, omniauth-google-oauth2