class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy, :map, :reviews, :update_review]

  # GET /search
  def search
    @selected_category_id = params[:category]
    @selected_location_id = params[:location]
    @merchants = Merchant.where(category_id: params[:category], location_id: params[:location]).take(8).each
    @categories = Category.all
    @locations = Location.all
    render 'search_results'
  end

  # GET /merchants
  # GET /merchants.json
  def index
    @merchants = Merchant.all
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
    @rating = Rating.where(merchant: @merchant, user: @current_user)
    @average = Rating.where(merchant_id: @merchant.id).average(:score)
  end

  # GET /map
  def map
  end

  # GET /merchants/new
  def new
    @merchant = Merchant.new
  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Merchant was successfully created.' }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to @merchant, notice: 'Merchant was successfully updated.' }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to merchants_url, notice: 'Merchant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reviews
    @reviews = Rating.where(merchant_id: @merchant.id)
    @review = Rating.new
  end

  def update_review
    Rating.create(user: current_user, merchant: @merchant, score: params[:score], comment: params[:comment])
    redirect_to reviews_merchant_path(@merchant)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_params
      params.require(:merchant).permit(:name, :address, :lat, :lng, :category, :location, :phone, :website, :email)
    end
end
