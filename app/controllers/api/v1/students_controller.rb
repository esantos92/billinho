module Api
    module V1
        class StudentsController < ApplicationController
            #Listar Alunos
            def index
                students = Student.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Alunos carregados', data:students},status: :ok
            end

            #Listar aluno individualmente
            def show
                student = Student.find(params[:id])
                render json: {status: 'SUCCESS', message:'Aluno carregado', data:student},status: :ok
            end

            #Incluir aluno
            def create
				student = Student.new(student_params)               
				if student.save
					render json: {status: 'SUCCESS', message:'Dados do aluno salvos', data:student},status: :ok
				else
					render json: {status: 'ERROR', message:'Os dados do aluno não foram salvos', data:student.errors},status: :unprocessable_entity
				end
			end

            def update
                student = Student.find(params[:id])
                if student.update(student_params)
                    render json: {status: 'SUCCESS', message:'Os dados do Aluno foram atualizados', data: student},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Os dados do Aluno não foram salvos', data: student.errors},status: :unprocessable_entity
                end

            end

            def destroy
                student = Student.find(params[:id])
                student.destroy
                render json: {status: 'SUCCESS', message: 'As informações foram excluídas', data: student},status: :ok
            end

            private
            #Definição de  parâmetros aceitos
			def student_params
				params.permit(:name, :cpf, :birthday_date, :celphone, :gender, :cep, :number, :payment_mode)
			end


        end
    end
end  