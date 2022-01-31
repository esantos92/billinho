module Api
    module V1
        class BillsController < ApplicationController
            #Listar faturas
            def index
                bills = Bill.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Faturas carregadas', data:bills}, status: :ok
            end

            #Listar fatura individualmente
            def show
                bill = Fatura.find(params[:id])
                render json: {status: 'SUCCESS', message:'Fatura carregada', data:bill}, status: :ok
            end
        end
    end
end
