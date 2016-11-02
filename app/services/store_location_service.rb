module StoreLocationService
  def self.fetch(zip)
    JSON.parse(response.body)["stores"]
  end

  def self.conn
    Faraday.new(:url => 'https://api.bestbuy.com/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.response
    response = conn.get do |req|
      req.url '/v1/stores(area(80202,25))'
      req.params['format'] = 'json'
      req.params['show'] = 'longName,city,distance,phone,storeType'
      req.params['pageSize'] = '50'
      req.params['apiKey'] = ENV["API_KEY"]
    end
  end
end
