class BudgetsController < ApplicationController
  def create
    @budget = Budget.new budget_params
    @budget.user = current_user
    if @budget.save
      flash[:success] = "Budget is saved successfully"
      redirect_to budgets_path
    else
      render :new
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

  private

  def budget_params
    params.require(:budget).permit([:item, :price])
  end

end
