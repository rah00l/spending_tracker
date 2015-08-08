class TransactsController < ApplicationController
  before_action :set_transact, only: [:show, :edit, :update, :destroy]

  # GET /transacts
  # GET /transacts.json
  def index
    @transacts = Transact.all
    @income = Transact.collective_income
    @expense = Transact.collective_expense
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
