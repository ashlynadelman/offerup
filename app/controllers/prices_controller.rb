class PricesController < ApplicationController
  before_action :set_price, only: %i[show edit update destroy]

  def index
    @q = Price.ransack(params[:q])
    @prices = @q.result(distinct: true).includes(:item_titles, :searches,
                                                 :users, :categories).page(params[:page]).per(10)
  end

  def show
    @search = Search.new
    @item = Item.new
  end

  def new
    @price = Price.new
  end

  def edit; end

  def create
    @price = Price.new(price_params)

    if @price.save
      redirect_to @price, notice: "Price was successfully created."
    else
      render :new
    end
  end

  def update
    if @price.update(price_params)
      redirect_to @price, notice: "Price was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @price.destroy
    redirect_to prices_url, notice: "Price was successfully destroyed."
  end

  private

  def set_price
    @price = Price.find(params[:id])
  end

  def price_params
    params.fetch(:price, {})
  end
end
