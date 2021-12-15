# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#nome: Faker::Name.name_with_middle
#cpf: Faker::String.random(length: 4)
#data_nasc: Faker::Date.between(from: '2000-01-01', to: '2014-09-25')
#celular: Faker::Number.number(digits: 10)
#genero: Faker::Gender.short_binary_type
#forma_pagamento: 'Boleto'

Aluno.create({
    nome: 'Everton Souza',
    cpf: 3333333888888,
    genero: 'M',
    forma_pagamento: 'Cartão'
})

Ie.create({
    nome: 'Univap',
    cnpj: 44444444,
    tipo: 'Universidade'
})
