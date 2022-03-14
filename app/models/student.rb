class Student < ApplicationRecord
    has_many :enrollments

    validates :name, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, format: { :with => /\A\d{3}\.\d{3}\.\d{3}\-\d{2}\Z/,
    message: "Formato de CPF inválido, use: XXX.XXX.XXX-XX"}
    validates :celphone, format: { :with => /\A\(\d{2}\)\d{5}\-\d{4}\Z/,
    message: "Formato de telefone inválido, use: (XX)XXXXX-XXXX"}
    validates :gender, presence: true, inclusion: { in: %w(M F), 
        message: "%{value} não é um tipo válido, utilize M ou F como opções."}
    validates :payment_mode, presence: true, inclusion: { in: %w(Boleto Cartão), 
        message: "%{value} não é um tipo válido, utilize Boleto ou Cartão como opções."}
    validates :cep, presence: true
    validates :number, presence: true    
    validate :writer_adress
    
    private
    
    def writer_adress        
        address = ViaCep::Address.new(cep)
        self.adress = address.street
        self.district = address.neighborhood
        self.city = address.city
        self.state = address.state
    end
end
