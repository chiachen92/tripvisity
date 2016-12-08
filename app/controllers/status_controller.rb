class StatusController < ApplicationController

    def create
      budget = Budget.find params[:budget_id]
      budget.status = true
      budget.save
      redirect_to budgets_path
    end

    # def destroy
    #   budget = budget.find params[:budget_id]
    #   budget.completed = false
    #   budget.save
    #   redirect_to budgets_path
    # end
    def update
      budget = Budget.find params[:budget_id]
      budget.status = false
      budget.save
      redirect_to budgets_path
    end

end
