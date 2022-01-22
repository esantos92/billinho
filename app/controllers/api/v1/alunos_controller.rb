module Api
    module V1
        class AlunosController < ApplicationController
            #Listar Alunos
            def index
                alunos = Aluno.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Alunos carregados', data:alunos},status: :ok
            end

            #Listar aluno individualmente
            def show
                aluno = Aluno.find(params[:id])
                render json: {status: 'SUCCESS', message:'Aluno carregado', data:aluno},status: :ok
            end

            #Incluir aluno
            def create
				aluno = Aluno.new(aluno_params)
				if aluno.save
					render json: {status: 'SUCCESS', message:'Dados do aluno salvos', data:aluno},status: :ok
				else
					render json: {status: 'ERROR', message:'Os dados do aluno não foram salvos', data:aluno.errors},status: :unprocessable_entity
				end
			end

            private
            #Definição de  parâmetros aceitos
			def aluno_params
				params.permit(:nome, :cpf, :data_nasc, :celular, :genero, :forma_pagamento)
			end


        end
    end
end  