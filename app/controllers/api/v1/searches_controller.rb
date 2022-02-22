class Api::V1::SearchesController < Api::V1::GraphitiController
  def index
    searches = SearchResource.all(params)
    respond_with(searches)
  end

  def show
    search = SearchResource.find(params)
    respond_with(search)
  end

  def create
    search = SearchResource.build(params)

    if search.save
      render jsonapi: search, status: :created
    else
      render jsonapi_errors: search
    end
  end

  def update
    search = SearchResource.find(params)

    if search.update_attributes
      render jsonapi: search
    else
      render jsonapi_errors: search
    end
  end

  def destroy
    search = SearchResource.find(params)

    if search.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: search
    end
  end
end
