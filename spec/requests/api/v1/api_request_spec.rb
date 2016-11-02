require 'rails_helper'

RSpec.describe "Request is sent to API" do
  it "can create a new item" do
    params = {name: "widget", description: "an arbitrary unit of production"}
    post "/api/v1/items", params: params
    item_response = JSON.parse(response.body)

    expect(response.code).to eq("201")
    expect(Item.last.name).to eq("widget")
    
    expect(item_response["id"]).to eq(Item.last.id)
    expect(item_response["name"]).to eq("widget")
    expect(item_response["description"]).to eq("an arbitrary unit of production")
    expect(item_response["created_at"]).to eq(nil)
    expect(item_response["updated_at"]).to eq(nil)
  end

  it "can return one item" do
    item = Fabricate(:item)

    get "/api/v1/items/#{item.id}"
    item_response = JSON.parse(response.body)

    expect(response.code).to eq("200")
    expect(item_response["name"]).to eq(item.name)
    expect(item_response["created_at"]).to be(nil)
    expect(item_response["updated_at"]).to be(nil)
  end

  it "can return all items" do
    items = Fabricate.times(2, :item)

    get "/api/v1/items"
    item_response = JSON.parse(response.body)

    expect(response.code).to eq("200")
    expect(item_response.count).to eq(2)
    expect(item_response.last["name"]).to eq(items.last.name)
  end

  it "can edit one item" do
    item = Fabricate(:item)

    expect(Item.find(item.id).name).to_not eq("widget")

    params = {name: "widget", description: "an arbitrary unit of production"}
    patch "/api/v1/items/#{item.id}", params: params

    expect(Item.find(item.id).name).to eq("widget")
  end

  it "can delete one item" do
    item = Fabricate(:item)

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response.code).to eq("204")
    expect(Item.count).to eq(0)
  end
end
