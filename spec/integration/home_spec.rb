require_relative '../spec_helper'
 
   describe 'home page' do
     it 'welcomes the user' do
       visit root_url
       assert_equal root_path, current_path
       assert has_selector? 'div#dino'
       assert has_selector? '.navbar'
     end
   end

