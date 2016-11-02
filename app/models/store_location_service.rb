module StoreLocationService
  def self.fetch(zip)
    conn = Faraday.new(:url => 'https://api.bestbuy.com/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end

    conn.get do |req|         # GET http://sushi.com/search?page=2&limit=100
      req.url '/v1/stores(area(80202,25))', :page => 2
      req.params['format'] = 'json'
      req.params['show'] = 'longName,city,distance,phone,storeType'
      req.params['pageSize'] = '50'
      req.params['apiKey'] = ENV["API_KEY"]
    end

    # response = conn.get "/v1/stores(area(80202,25))?
    # format=json
    # show=longName,city,distance,phone,storeType
    # pageSize=50
    # apiKey=#{ENV["API_KEY"]}"

    JSON.parse(response.body)["stores"]
  end
end
