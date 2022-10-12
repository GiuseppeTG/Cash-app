class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @expenses = Group.find(params[:group_id]).expenses.order(created_at: :desc)
    @group = Group.find(params[:group_id])
  end

  # GET /expenses/1 or /expenses/1.json
  def show
    @group = Group.find(params[:group_id])
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @group = Group.find(params[:group_id])
    @groups = Group.where(user_id: current_user)
    @groups = @groups.where.not(id: params[:group_id])
  end

  # GET /expenses/1/edit
  def edit
    @group = Group.find(params[:group_id])
  end

  # POST /expenses or /expenses.json
  def create
    @group = Group.find(params[:group_id])
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    @expense.groups.push(@group)
    params[:expense][:groups].each do |g_id|
      @expense.groups.push(Group.find(g_id)) unless g_id == ''
    end

    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_expenses_path(@group), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    @group = Group.find(params[:group_id])
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expense_url(@expense), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @group = Group.find(params[:group_id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to group_expenses_path(@group), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :groups)
  end
end
