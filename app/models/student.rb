class Student < ApplicationRecord
    has_many :enrollments

    validates :name, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, numericality: { only_integer: true }
    validates :gender, presence: true, inclusion: { in: %w(M F), 
        message: "%{value} não é um tipo válido, utilize M ou F como opções."}
    validates :payment_mode, presence: true, inclusion: { in: %w(Boleto Cartão), 
        message: "%{value} não é um tipo válido, utilize Boleto ou Cartão como opções."}
end
