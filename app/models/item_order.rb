class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :building_name
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end