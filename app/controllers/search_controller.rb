class SearchController < ApplicationController
  def index
    raw_stores = StoreLocationService.fetch(params["zip"])

    @stores = Store.return_stores(raw_stores, params["zip"])
  end
end
