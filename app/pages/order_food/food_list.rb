class FoodList < Page
	def initialize
		@id        = PageId.new({
			                        web:   { text: 'Food Items:' },
			                        ios:   "UINavigationBar marked:'Food Items'",
			                        droid: "* id:'lvFoodItems'"
		                        })
		@food_item = Field.transition_element({
			                                      web:   { link_text: '%s' },
			                                      droid: "* {text CONTAINS '%s'}",
			                                      ios:   "UITableViewLabel {text CONTAINS '%s'}"
		                                      },
		                                      {
			                                      to: FoodItemDetail
		                                      })

		super('food list page')
	end

	def order_items(order_items)
		order_items.each do |item|
			item.quantity.times do
				@food_item.click item.item_name
				App.food_item_detail_page.add_to_cart
				App.menu_page.launch Menu::FOOD_ITEMS
			end
		end
	end

end

PageRegistry.register_page(FoodList)
