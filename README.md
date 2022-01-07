# Billinho

## Descrição
O projeto Billinho é um projeto o qual faz parte do teste técnico do OnBoarding de estagiário da Quero Educação. A ideia é desenvolver uma API que simulam o gerenciamento das mensalidade de um Aluno relacionados a algum curso em alguma determinada instituição de ensino.

## Stack do projeto

* Ruby
* Rails
* PostgreSQL
* Docker

## Modelos e campos

- Aluno
    * Nome
    * CPF
    * Data de Nascimento
    * Celular
    * Genêro
    * Forma de Pagamento

- Instituição (Ie)
    * Nome
    * CNPJ
    * Tipo

- Matrícula
    * Nome do Curso
    * Valor total do Curso
    * Quantidade de Faturas (parcelas)
    * dia de vencimento
    * ID do Aluno
    * ID da Instituição

- Fatura
    * Valor da Faturas
    * Data do vencimento
    * Status
    * ID da Matricula

## Ações da API

    * Listar e criar Instituições
    * Listar e criar Alunos
    * Listar e criar Matriculas
    * Listar Faturas

## Restrições

    As restrições da aplicação são validadas com o auxílio do recurso de validações do Active Record incluído pelo rails.

    Foram utilizadas as seguintes restrições:

    - Aluno
        * Nome: Não pode ser um campo em branco e deve ser único.
        * CPF: Sem pontos e traço, não pode ser um campo em branco e deve ser único.
        * Gênero: Não pode ser um campo em branco devendo conter os caracteres M ou F.
        * Forma de pagamento: Não pode ser um campo em branco devendo ser Boleto ou Cartão.
    
    - Instituição
        * Nome: Não pode ser um campo em branco e deve ser único.
        * CNPJ: Sem pontos e traço, não pode ser um campo em branco e deve ser único.
        * Tipo: Não pode ser um campo em branco e deve ser Universidade, Escola ou Creche.

    - Matrícula
        * Nome do curso: Não pode ser um campo em branco.
        * Valor total do curso: Não pode ser um campo em branco devendo ser um valor positivo.
        * Dia de vencimento: Não pode ser um campo em branco devendo estar entre 1 (inclusive) e 30 (inclusive), conforme calendário comercial.
        * ID do aluno: Não pode ser um campo em branco.
        * ID da instituição: Não pode ser um campo em branco.

    - Fatura
        * Valor da fatura: Não pode ser um campo em branco.
        * Data do vencimento: Não pode ser um campo em branco.
        * Status: Não pode ser um campo em branco e deve ser Aberta, Atrasada ou Paga.

## Detalhando as Faturas
    Conforme pode ser observado na descrição das ações da API o modelo de Faturas podem apenas ser listados, portanto como vão ser geradas as faturas?

    A criação de faturas está associado a criação das matrículas. A partir da utilização de um Use Case que determina a lógica da criação e o tratamento de datas das faturas, todas as faturas de uma matricula são criadas no momento que esta é gerada com o auxílio do Callback after_create disponíbilizado pelo Active Records.

## Como rodar o Billinho?

    1- Clone o repositório.
        $ git clone https://github.com/esantos92/billinho

    2- Após acessar a pasta do projeto instale todas as dependencias
        $ bundle install
    
    3- Crie o Banco de Dados
        $ rails db:create
        $ rails db:migrate
    
    4- Rode aplicação
        $ rails s
    
    Utilize o Postman ou Insomnia para utilizar a aplicação a pártir de http://localhost:3000.
    As rotas da API utilizam o JSON em seu formato de dados.