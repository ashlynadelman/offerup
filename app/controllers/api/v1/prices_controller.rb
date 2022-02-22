class Api::V1::PricesController < Api::V1::GraphitiController
  def index
    prices = PriceResource.all(params)
    respond_with(prices)
  end

  def show
    price = PriceResource.find(params)
    respond_with(price)
  end

  def create
    price = PriceResource.build(params)

    if price.save
      render jsonapi: price, status: 201
    else
      render jsonapi_errors: price
    end
  end

  def update
    price = PriceResource.find(params)

    if price.update_attributes
      render jsonapi: price
    else
      render jsonapi_errors: price
    end
  end

  def destroy
    price = PriceResource.find(params)

    if price.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: price
    end
  end
end
