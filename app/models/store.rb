class Store
  attr_reader :name, :city, :distance, :phone, :type, :zip

  def initialize(raw_store, zip)
    @name = raw_store["longName"]
    @city = raw_store["city"]
    @distance = raw_store["distance"]
    @phone = raw_store["phone"]
    @type =raw_store["storeType"]
    @zip = zip
  end

  def self.return_stores(raw_stores, zip)
    raw_stores.map do |raw_store|
      new(raw_store, zip)
    end
  end
end
