class UpdateBill < CreateBill
    include UseCase

    attr_reader :enrollment, :total_value, :bills_amount, :due_day, :bill_value

    def initialize(enrollment)
        @enrollment = enrollment
        @total_value = enrollment.total_value
        @bills_amount = enrollment.bills_amount
        @due_day = enrollment.due_day
    end
    
    def perform
    #Primeiro preciso saber quantas bills eu tenho na base e se vou criar ou deletar Bills
        create_or_delete_bills

    end
   
    def create_or_delete_bills
        #separando as bills já existentes em um array
        bills = Bill.where(enrollment_id: enrollment.id)

        #eu vou deletar bills sobressalentes e atualizazr as que ficarem, necessário
        if bills.length > bills_amount
            #cáculo quantas bills devo deletar + mais uma pois vou gerar uma com dados novos para servir de base
            bills_to_delete = (billl.length - bill_amount) + 1

            #excluo as bills
            bills_to_delete.times do |bill|
                bill= Bill.where(enrollment_id: enrollment.id).order(:created_at)
                bill.destroy
            end

            #gero a bill de base
            generate_bills (1)
            updated_bill = Bill.where(enrollment_id: enrollment.id).order(:created_at).last

            #Atualizo as bills
            bills.each do |bill|
                bill.update(
                    bill_value: updated_bill.bill_value,
                    due_date: updated_bill.due_date,
                    enrollment_id: updated_bill.enrollment_id,
                    status: 'Aberta'
                  )
            end           

        #eu vou criar as bills faltantes e atualizazr as que já constam, se necessário
        elsif bill.length < bills_amount
            #calculo quantas bills devo criar
            bills_to_create = bill_amount - bill.length

            #gero as bills necessárias
            generate_bills (bills_to_create)
            updated_bill = Bill.where(enrollment_id: enrollment.id).order(:created_at).last

            #atualizo as bills utilizando uma das criadas como base (updated_bill)
            bills.each do |bill|
                bill.update(
                    bill_value: updated_bill.bill_value,
                    due_date: updated_bill.due_date,
                    enrollment_id: updated_bill.enrollment_id,
                    status: 'Aberta'
                  )
            end
        #atualizar as bills em banco
        else
            #excluo uma bill
            #crio uma nova para servir de modelo
            #atualizo as restantes
        end
        
    end

    

end