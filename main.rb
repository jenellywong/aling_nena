require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

# ROUTES FOR ADMIN SECTION
get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/' do
	@products = Item.all
	@ten = @products.sample(10)
	erb :home
end

get '/about' do
	erb :about_page
end

get '/products' do
	@products = Item.all
	erb :products_page
end

get '/purchase/:id' do
	@products = Item.all	
	@product = Item.find(params[:id])
	erb :buy
end

post '/purchase/:id' do
	@product = Item.find(params[:id])
	@something = MoneyCalculator.new(params[:ones], params[:fives], params[:tens], params[:twenties], params[:fifties], params[:hundreds], params[:five_hundreds], params[:thousands])
	@givechange = @something.change(@product.price, params[:quantity])
	@product.update_attributes(
	quantity: @product.quantity - params[:quantity],
	sold: params[:quantity] + @product.sold
	)
	erb :bought
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# ROUTES FOR ADMIN SECTION
