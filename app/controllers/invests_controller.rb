class InvestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_invest, only: [:show, :edit, :update, :destroy]


  # GET /invests
  # GET /invests.json
  def index
    @invests = Invest.all
  end

  # GET /invests/1
  # GET /invests/1.json
  def show
  end

  # GET /invests/new
  def new
    @invest = Invest.new
  end

  # GET /invests/1/edit
  def edit
  end

  # POST /invests
  # POST /invests.json
  def create
    @invest = Invest.new(invest_params)

    respond_to do |format|
      if @invest.save
        format.html { redirect_to @invest, notice: 'Invest was successfully created.' }
        format.json { render :show, status: :created, location: @invest }
      else
        format.html { render :new }
        format.json { render json: @invest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invests/1
  # PATCH/PUT /invests/1.json
  def update
    respond_to do |format|
      if @invest.update(invest_params)
        format.html { redirect_to @invest, notice: 'Invest was successfully updated.' }
        format.json { render :show, status: :ok, location: @invest }
      else
        format.html { render :edit }
        format.json { render json: @invest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invests/1
  # DELETE /invests/1.json
  def destroy
    @invest.destroy
    respond_to do |format|
      format.html { redirect_to invests_url, notice: 'Invest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculate_investment_value
    data = Invest.calculate_current_amount(params[:invest_data][:amount], params[:invest_data][:combine_date])
    # data = 1234
    if data[0]
      render json: { data: data[1] }, status: 400
    else
      render json: { data: data[1] }, status: 200
    end
    # render json: { data: data }, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invest
      @invest = Invest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invest_params
      params.require(:invest).permit(:amount, :selected_date)
    end
end
