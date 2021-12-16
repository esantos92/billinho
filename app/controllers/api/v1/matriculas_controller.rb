module Api
    module V1
        class MatriculasController < ApplicationController
           #Listar matrículas
            def index
            matriculas = Matricula.order('created_at DESC')
            render json: {status: 'SUCCESS', message:'Matrículas carregadas', data:matriculas}, status: :ok
            end

            #Listar matrícula individualmente
            def show
                matricula = Matricula.find(params[:id])
                render json: {status: 'SUCCESS', message:'Matricula carregada', data:matricula}, status: :ok
            end
           
            #Incluir matriculas
           def create
                matricula = Matricula.new(matricula_params)
                if matricula.save
                    render json: {status: 'SUCCESS', message: 'Dados da matrícula salvos', data:matricula},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Os dados da matrícula não foram salvos', data:matricula.errors}, status: :unprocessable_entity
                end
            end 

            private
            #Definição dos parâmetros aceitos
            def matricula_params
                params.permit(:valor_total, :quantidade_faturas, :dia_vencimento, :nome_curso, :aluno_id, :ie_id)
                

            end
        end
    end
end