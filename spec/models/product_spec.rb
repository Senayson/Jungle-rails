require 'rails_helper'

RSpec.describe Product, type: :model do
 #Validate input data
  describe 'Validations:' do
    before(:each) do
      @category = Category.new(name: 'Sports')
    @product = @category.products.new({name: 'Velodrome Bicycle', price: 20, quantity: 4})
    end

   
      it 'Saves product when all fields are filled' do
      expect(@product.save).to eq true
      end

      it 'Fails to save when a name field is nil' do
        @product.name = nil
        expect(@product.save).to eq false
        expect(@product.errors.messages[:name]).to eq ["can't be blank"]
      end

      it 'Fails to save when price field is nil' do
        @product.price_cents = nil
        expect(@product.save).to eq false
        expect(@product.errors.messages[:price_cents]).to eq ["is not a number"]
      end
      
      
      it 'Fails to save when price field is not a number' do
        @product.price_cents = "people"
        puts @product.price_cents.class
        expect(@product.save).to eq false
        expect(@product.errors.messages[:price_cents]).to eq ["is not a number"]
      end

      it 'Fails to save when quantity field is nil' do
        @product.quantity = nil
        expect(@product.save).to eq false
        expect(@product.errors.messages[:quantity]).to eq ["can't be blank"]
      end

      it 'Fails to save when category field is nil' do
        puts @product.category.name
        @product.category = nil
        expect(@product.save).to eq false
        expect(@product.errors.messages[:category]).to eq ["can't be blank"]
      end
end

end
