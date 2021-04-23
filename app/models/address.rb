class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order, dependent: :destroy
  belongs_to :prefecture
end
