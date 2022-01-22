module Api
    module V1
        class IesController < ApplicationController
            #Listar Instituições de Ensino
            def index
                ies = Ie.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Instituições carregadas', data:ies},status: :ok
            end

            #Listar instituição individualmente
            def show
                ie = Ie.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Instituição carregada', data:ie},status: :ok
            end
            #incluir Instituição
            def create
                ie = Ie.new(ie_params)
                if ie.save
                    render json: {status: 'SUCCESS', message: 'Dados da instituição salvos.', data:ie},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Os dados da instituição não foram salvos.', data:ie.errors}, status: :unprocessable_entity
                end
            end

            private
            #Definição de parâmetros aceitos
            def ie_params
                params.permit(:nome, :cnpj, :tipo)
            end
        end
    end
end