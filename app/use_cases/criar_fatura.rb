class CriarFatura 
    include UseCase

    attr_reader :matricula, :valor_total, :quantidade_faturas, :dia_vencimento, :valor_fatura

    def initialize(matricula, matricula_params)
        @matricula = matricula.presence
        @valor_total = matricula_params[:valor_total]
        @quantidade_faturas = matricula_params[:quantidade_faturas]
        @dia_vencimento = matricula_params[:dia_vencimento]
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
        data_hoje = Date.today
        if data_hoje.day.to_i <= dia_vencimento
            primeiro_vencimento = Date.new(dia_vencimento, data_hoje.month, data_hoje.year)
        else
            primeiro_vencimento = Date.new(dia_vencimento, data_hoje.next_month.month, data_hoje.year)
        end
    end

    def gerar_faturas
        data_fatura = data_primeira_fatura(matricula.dia_vencimento)
        matricula.quantidade_faturas.times do
            criar_fatura(data_fatura)
            data_fatura = data_fatura.next_month

    end

    def criar_fatura (data_vencimento)
        fatura = Fatura.create({
          valor_fatura: valor_fatura,
          data_vencimento: data_vencimento,
          matricula_id: matricula.id
        })

        if fatura.save
            render json: {status: 'SUCCESS', message: 'Dados da fatura salvos', data:fatura},status: :ok
        else
            render json: {status: 'ERROR', message: 'Os dados da fatura não foram salvos', data:fatura.errors}, status: :unprocessable_entity
        end
    end        

    
end