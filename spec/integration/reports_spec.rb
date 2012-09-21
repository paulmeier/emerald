require 'spec_helper'

  describe 'reports page' do
    it 'has ziips box' do
      visit reports_path
      assert_equal reports_path, current_path
      page.should have_content('ZIIP')
      page.should have_content('CPU')
      assert has_selector? 'div#box'
      assert has_selector? '.navbar'
      assert has_selector? '.dropdown-menu'      
    end
    
  end