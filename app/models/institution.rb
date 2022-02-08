class Institution < ApplicationRecord
    has_many :enrollments

    validates :name, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, format: { :with => /\A\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}\Z/,
        message: "Formato de CNPJ invalido"}
    validates :institution_type, inclusion: { in: %w(Universidade Escola Creche), 
        message: "%{value} não é um tipo válido, utilize Universidade, Escola ou Creche como opções."}   
end
