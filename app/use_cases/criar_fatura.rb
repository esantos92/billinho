class CriarFatura 
    include UseCase

    attr_reader :matricula, :valor_total, :quantidade_faturas, :dia_vencimento, :valor_fatura

    def initialize(matricula)
        @matricula = matricula
        @valor_total = matricula.valor_total
        @quantidade_faturas = matricula.quantidade_faturas
        @dia_vencimento = matricula.dia_vencimento
    end

    def perform
        calcular_valor_fatura
        gerar_faturas
    end

    private

    def calcular_valor_fatura
        @valor_fatura = (valor_total / quantidade_faturas).truncate(2)
        
    end

    def data_primeira_fatura (dia_vencimento)
        dia_hoje = Date.today.day.to_i        
        if dia_hoje <= dia_vencimento
            primeiro_vencimento = Date.today.change(day: dia_vencimento)
        else             
            primeiro_vencimento = Date.today.next_month.change(day: dia_vencimento)
        end
    end

    def gerar_faturas
        data_fatura = data_primeira_fatura(dia_vencimento)
        quantidade_faturas.times do
            if data_fatura.month.to_i != 2 && data_fatura.day.to_i < dia_vencimento
                data_fatura = data_fatura.change(day: dia_vencimento)
            end
            criar_fatura(data_fatura)
            data_fatura = data_fatura.next_month
        end
    end

    def criar_fatura (data_vencimento)
        fatura = Fatura.create!({
          valor_fatura: valor_fatura,
          data_vencimento: data_vencimento,
          matricula_id: matricula.id,
          status: 'Aberta'
        })
     
    end   
end