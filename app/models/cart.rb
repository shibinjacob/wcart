class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy

	def add_product(product, cart)
		current_item = line_items.where(:product_id => product.id).first
		if current_item
			current_item.quantity += 1
		else
			#current_item = line_items.build(:product_id => product_id)
			line_item = line_items.new
			line_item.product_id = product.id
			line_item.cart_id = cart.id
			current_item = line_item
			current_item
		end
		current_item
	end
end
