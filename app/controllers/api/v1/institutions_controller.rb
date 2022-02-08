module Api
    module V1
        class InstitutionsController < ApplicationController
            #Listar Instituições de Ensino
            def index
                institutions = Institution.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Instituições carregadas', data:institutions},status: :ok
            end

            #Listar instituição individualmente
            def show
                institution = Institution.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Instituição carregada', data:institution},status: :ok
            end
            #incluir Instituição
            def create
                institution = Institution.new(institution_params)
                if institution.save
                    render json: {status: 'SUCCESS', message: 'Dados da instituição salvos.', data:institution},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Os dados da instituição não foram salvos.', data:institution.errors}, status: :unprocessable_entity
                end
            end

            #atualizar dados insituição
            def update
                institution = Institution.find(params[:id])
                if institution.update(institution_params)
                    render json: {status: 'SUCCESS', message: 'Dados da instituição atualizados', data:institution}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Os dados da instituição não foram atualizados', data:institution.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                institution = Institution.find(params[:id])
                institution.destroy
                render json: {status: 'SUCCESS', message: 'Instituição deletada', data: institution}, status: :ok
            end
            
            private
            #Definição de parâmetros aceitos
            def institution_params
                params.permit(:name, :cnpj, :institution_type)
            end
        end
    end
end