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
        data_hoje = Date.today.day
        mes_hoje = Date.today.month
        ano_hoje = Date.today.year
        if data_hoje.day.to_i <= dia_vencimento
            primeiro_vencimento = Date.new(ano_hoje, mes_hoje, dia_vencimento)
        else
            mes_hoje = Date.today.next_month.month
            primeiro_vencimento = Date.new(ano_hoje, mes_hoje, dia_vencimento)
        end
    end

    def gerar_faturas
        data_fatura = data_primeira_fatura(dia_vencimento)
        quantidade_faturas.times do
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