class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get 'baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :DESC)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    max_price = BakedGood.maximum(:price).to_json
    BakedGood.find_by(price: max_price).to_json
  end


end
