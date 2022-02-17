class CreateBill 
    include UseCase

    attr_reader :enrollment, :total_value, :bills_amount, :due_day, :bill_value

    def initialize(enrollment)
        @enrollment = enrollment
        @total_value = enrollment.total_value
        @bills_amount = enrollment.bills_amount
        @due_day = enrollment.due_day
    end

    def perform
        calculate_bill_value
        generate_bills (bills_amount)
    end

    private

    def calculate_bill_value
        @bill_value = (total_value / bills_amount).truncate(2)
        
    end

    def date_first_bill (due_day)
        today_day = Date.today.day.to_i        
        if today_day <= due_day
            first_due = Date.today.change(day: due_day)
        else             
            first_due = Date.today.next_month.change(day: due_day)
        end
    end

    def generate_bills (bills_amount)
        bill_date = date_first_bill(due_day)
        bills_amount.times do
            if bill_date.month.to_i != 2 && bill_date.day.to_i < due_day
                bill_date = bill_date.change(day: due_day)
            end
            create_bill(bill_date)
            bill_date = bill_date.next_month
        end
    end

    def create_bill(due_date)
        bill = Bill.create!({
          bill_value: bill_value,
          due_date: due_date,
          enrollment_id: enrollment.id,
          status: 'Aberta'
        })
     
    end   
end