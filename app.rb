require "sinatra/base"
require_relative "ruby_template"

class MyApp < Sinatra::Application

  def initialize
    super
    @items = [
      "Hamburger",
      "French Fries",
      "Blocks of Cheese",
    ]
  end

  get "/" do
    erb :root, :locals => { :number_items => item_length}
  end

  get "/items" do
    erb :items
  end

  get "/items/new" do
    erb :new_item
  end

  post "/items" do
    new_item = params[:eaten]
    @items << new_item.to_s
    erb :items
  end

  get "/items/:item_number" do
     identifier = params[:item_number].to_i
    "You ate: #{@items[identifier]}"
  end



  run! if app_file == $0

end

