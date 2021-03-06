class BudgetsController < ApplicationController

  # def new
  #   @budget = Budget.new
  # end

  def create
    @budget = Budget.new budget_params
    @budget.user = current_user
    if @budget.save
      flash[:success] = "Budget is saved successfully"
      redirect_to budgets_path
    else
      flash[:danger] = "Unable to save budget"
      redirect_to budgets_path
    end
  end

  # def show
  #   @budget = Budget.find params[:id]
  # end

  def index
    @budget = Budget.new
    @budgets = Budget.order(created_at: :desc)
  end

  def edit
    @budget = Budget.find params[:id]
  end

  def update
    @budget = Budget.find params[:id]
    if @budget.update budget_params
      redirect_to budget_path(@budget)
    else
      render :edit
    end
  end

  def destroy
    @budget = Budget.find params[:id]
    @budget.destroy
    flash[:danger] = "Budget was deleted"
    redirect_to budgets_path
  end

  # def complete
  #   @budget = Budget.find params[:budget_id]
  #   @budget.update_attribute(:status, [true|false])
  #   redirect_to budgets_path
  # end

  private

  def budget_params
    params.require(:budget).permit([:item, :price])
  end

end
