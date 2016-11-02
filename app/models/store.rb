class Store
  def initialize(raw_store)
    require "pry"; binding.pry
  end

  def return_stores(raw_stores)
    raw_stores.map do |raw_store|
      new(raw_store)
    end
  end
end
