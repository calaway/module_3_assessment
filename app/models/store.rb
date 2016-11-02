class Store
  attr_reader :name, :city, :distance, :phone, :type

  def initialize(raw_store)
    @name = raw_store["longName"]
    @city = raw_store["city"]
    @distance = raw_store["distance"]
    @phone = raw_store["phone"]
    @type =raw_store["storeType"]
  end

  def self.return_stores(raw_stores)
    raw_stores.map do |raw_store|
      new(raw_store)
    end
  end
end
