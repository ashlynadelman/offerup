class SearchesController < ApplicationController
  before_action :set_search, only: %i[show edit update destroy]

  # GET /searches
  def index
    @q = Search.ransack(params[:q])
    @searches = @q.result(distinct: true).includes(:item, :price,
                                                   :category).page(params[:page]).per(10)
  end

  # GET /searches/1
  def show; end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit; end

  # POST /searches
  def create
    @search = Search.new(search_params)

    if @search.save
      message = "Search was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @search, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /searches/1
  def update
    if @search.update(search_params)
      redirect_to @search, notice: "Search was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /searches/1
  def destroy
    @search.destroy
    message = "Search was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to searches_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_search
    @search = Search.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def search_params
    params.require(:search).permit(:item_id, :price_id, :category_id)
  end
end
