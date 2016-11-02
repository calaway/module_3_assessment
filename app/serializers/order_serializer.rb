class OrderSerializer < ActiveModel::Serializer
  attributes :id, :amount, :user_id
end
