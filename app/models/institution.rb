class Institution < ApplicationRecord
    has_many :enrollments

    validates :name, presence: true, uniqueness: true
    validates :cnpj, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :institution_type, inclusion: { in: %w(Universidade Escola Creche), 
        message: "%{value} não é um tipo válido, utilize Universidade, Escola ou Creche como opções."}   
end
