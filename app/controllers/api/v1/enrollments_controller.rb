module Api
    module V1
        class EnrollmentsController < ApplicationController
           #Listar matrículas
            def index
            enrollments = Enrollment.order('created_at DESC')
            render json: {status: 'SUCCESS', message:'Matrículas carregadas', data:enrollments}, status: :ok
            end

            #Listar matrícula individualmente
            def show
                enrollment = Enrollment.find(params[:id])
                render json: {status: 'SUCCESS', message:'Matricula carregada', data:enrollment}, status: :ok
            end
           
            #Incluir matriculas
           def create
                enrollment = Enrollment.new(enrollment_params)
                if enrollment.save
                    render json: {status: 'SUCCESS', message: 'Dados da matrícula e faturas referentes salvos', data:enrollment},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Os dados da matrícula não foram salvos', data:enrollment.errors}, status: :unprocessable_entity
                end
            end

            def update
                enrollment = Enrollment.find(params[:id])
                if enrollment.update(enrollment_params)
                    render json: {status: 'SUCCESS', message: 'Dados da matricula e faturas foram atualizados', data:enrollment}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Os dados da matricula não foram salvos', data:enrollment.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                enrollment = Enrollment.find(params[:id])
                enrollment.destroy
                render json: {status: 'SUCCESS', message: 'Matrícula e faturas deletadas', data: enrollment}, status: :ok
            end

            private
            #Definição dos parâmetros aceitos
            def enrollment_params
                params.permit(:total_value, :bills_amount, :due_day, :course_name, :student_id, :institution_id)
                

            end
        end
    end
end