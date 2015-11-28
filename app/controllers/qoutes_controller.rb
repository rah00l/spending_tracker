class QoutesController < ApplicationController

	before_action :set_qoute, only: [:show, :edit, :update, :destroy]

	# GET /qoutes
	# GET /qoutes.json
	def index
	  @qoutes = Qoute.order("created_at desc")
	end

	# GET /qoutes/1
	# GET /qoutes/1.json
	def show
	end

	# GET /qoutes/new
	def new
	  @qoute = Qoute.new
	end

	# GET /qoutes/1/edit
	def edit
	end

	# POST /qoutes
	# POST /qoutes.json
	def create
	  @qoute = Qoute.new(qoute_params)

	  respond_to do |format|
	    if @qoute.save
	      format.html { redirect_to qoutes_path, notice: 'Qoute was successfully created.' }
	      format.json { render :show, status: :created, location: @qoute }
	    else
	      format.html { render :new }
	      format.json { render json: @qoute.errors, status: :unprocessable_entity }
	    end
	  end
	end

	# PATCH/PUT /qoutes/1
	# PATCH/PUT /qoutes/1.json
	def update
	  respond_to do |format|
	    if @qoute.update(qoute_params)
	      format.html { redirect_to qoutes_path, notice: 'Qoute was successfully updated.' }
	      format.json { render :show, status: :ok, location: @qoute }
	    else
	      format.html { render :edit }
	      format.json { render json: @qoute.errors, status: :unprocessable_entity }
	    end
	  end
	end

	# DELETE /qoutes/1
	# DELETE /qoutes/1.json
	def destroy
	  @qoute.destroy
	  respond_to do |format|
	    format.html { redirect_to qoutes_url, notice: 'Qoute was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

	def random_qoute
		@qoute = Qoute.offset(rand(Qoute.count)).first
		respond_to do |format|
		  format.js
		end
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_qoute
	    @qoute = Qoute.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def qoute_params
	    params.require(:qoute).permit(:message, :user_id, :qoute_by)
	  end
end

