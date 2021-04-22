class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :municipality, :street_number, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :street_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture, numericality: {other_than: 0}
    validates :telephone_number, format: { with: /\A\d{1,11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture, municipality: municipality, street_number: street_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end