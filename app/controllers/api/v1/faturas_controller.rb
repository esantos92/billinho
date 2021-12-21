module Api
    module V1
        class FaturasController < ApplicationController
            #Listar faturas
            def index
                faturas = Fatura.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Faturas carregadas', data:faturas}, status: :ok
            end

            #Listar fatura individualmente
            def show
                fatura = Fatura.find(params[:id])
                render json: {status: 'SUCCESS', message:'Fatura carregada', data:fatura}, status: :ok
            end
        end
    end
end
