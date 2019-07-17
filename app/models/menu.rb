class Menu < ApplicationRecord
  has_and_belongs_to_many :products

  validates :name, presence: true, uniqueness: true

  def self.create_menu
    name ="Menu on  #{Time.now.strftime('%A (%m/%d/%y)')}"
    time = Time.now
    create(name: name, start_time: time)
  end

  def is_product?(product)
    products.exists?(product.id)
  end
end
