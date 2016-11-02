class SearchController < ApplicationController
  def index
    @zip = params["q"]

    raw_stores = StoreLocationService.fetch(@zip)

    @stores = Store.return_stores(raw_stores)
  end
end
