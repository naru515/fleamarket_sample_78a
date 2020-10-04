class Item < ApplicationRecord
  validates_associated :images
  validates :images, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :burden_id, presence: true
  validates :area_id, presence: true
  validates :shipping_date_id, presence: true
  

  # あとでアソシエーション記述する（残り、ユーザーモデルとの紐付け。）
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipping_date
end