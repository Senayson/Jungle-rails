require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  before :each do
        @category = Category.create! name: 'Apparel'
    
        10.times do |n|
          @category.products.create!(
            name:  Faker::Hipster.sentence(3),
            description: Faker::Hipster.paragraph(4),
            image: open_asset('apparel1.jpg'),
            quantity: 10,
            price: 64.99
          )
        end
      end

      scenario "Able to add product to cart after clicking" do 
        visit root_path
        el = page.find('article:first-child footer').click_on "Add"

       expect(page).to have_content ('1')

        save_screenshot
      end


end
