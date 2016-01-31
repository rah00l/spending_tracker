include TransactsHelper

class TransactsController < ApplicationController
  before_action :set_transact, only: [:show, :edit, :update, :destroy]

  # GET /transacts
  # GET /transacts.json
  def index
    @categories = Category.all
    @transact_type = Transact
                     .distinct(:transactable_type)
                     .pluck(:transactable_type)

    # Getting account ids for all accounts
    if params[:account_id] == 'All'
      account_id = Account.order('created_at').collect(&:id)
      @account_name = ['All Accounts']
      @account = 'All'
    else
      account_id = get_account_id
      @account_name = Account.where(id: account_id).pluck(:name)
      @account = account_id
    end

    ## duration and account_info mainly required for showing selected by user
    @duration_info = get_duration_info(params[:duration])
    @duration = params[:duration].present? ? params[:duration] : 'Monthly'

    if params[:duration] == 'Weekly'
      @transacts = Transact
                   .includes(transactable: :category)
                   .weekly
                   .by_account(account_id)
      @income = Transact.income.weekly.by_account(account_id).sum(:amount)
      @expense = Transact.expense.weekly.by_account(account_id).sum(:amount)
    elsif params[:duration] == 'Monthly'
      @transacts = Transact
                   .includes(transactable: :category)
                   .monthly
                   .by_account(account_id)
      @income = Transact.income.monthly.by_account(account_id).sum(:amount)
      @expense = Transact.expense.monthly.by_account(account_id).sum(:amount)
    elsif params[:duration] == 'Yearly'
      @transacts = Transact
                   .includes(transactable: :category)
                   .yearly
                   .by_account(account_id)
      @income = Transact.income.yearly.by_account(account_id).sum(:amount)
      @expense = Transact.expense.yearly.by_account(account_id).sum(:amount)
    else
      @transacts = Transact
                   .includes(transactable: :category)
                   .monthly
                   .by_account(account_id)
      @income = Transact.income.monthly.by_account(account_id).sum(:amount)
      @expense = Transact.expense.monthly.by_account(account_id).sum(:amount)
    end
  end

  # GET /transacts/1
  # GET /transacts/1.json
  def show
  end

  # GET /transacts/new
  def new
    @transact = Transact.new
  end

  # GET /transacts/1/edit
  def edit
  end

  # POST /transacts
  # POST /transacts.json
  def create
    @transact = Transact.new(transact_params)

    respond_to do |format|
      if @transact.save
        format.html { redirect_to @transact, notice: 'Transact was successfully created.' }
        format.json { render :show, status: :created, location: @transact }
      else
        format.html { render :new }
        format.json { render json: @transact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transacts/1
  # PATCH/PUT /transacts/1.json
  def update
    respond_to do |format|
      if @transact.update(transact_params)
        format.html { redirect_to @transact, notice: 'Transact was successfully updated.' }
        format.json { render :show, status: :ok, location: @transact }
      else
        format.html { render :edit }
        format.json { render json: @transact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transacts/1
  # DELETE /transacts/1.json
  def destroy
    @transact.destroy
    respond_to do |format|
      format.html { redirect_to transacts_url, notice: 'Transact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transact
    @transact = Transact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transact_params
    params.require(:transact).permit(:transactable_id, :transactable_type, :amount)
  end
end
