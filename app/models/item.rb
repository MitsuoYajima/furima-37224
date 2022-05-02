class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :image,              presence: true
  validates :title,              presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :days_to_ship_id,    presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :price,              presence: true, numericality: { greater_than: 299, less_than: 10_000_000, only_integer: true }
end