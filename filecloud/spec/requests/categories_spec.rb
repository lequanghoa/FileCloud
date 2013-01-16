require 'spec_helper'

describe "Categories" do

subject { page }
  it "Should has a Edit link" do
  	  visit '/categories'
      page.should have_content 'Edit'
    end
    it "Should has a Show link" do
  	  visit '/categories'
      page.should have_content 'Show'
    end
    it "Should has a Delete link" do
  	  visit '/categories'
      page.should have_content 'Delete'
    end


	describe "Create category" do
	   before { visit '/categories'}
       let(:submit) { "Create Category" }

		describe "with valid information" do
			before do
				fill_in 'Name', :with => "Movie"
				fill_in 'category_description', :with => "Comedy"
			end
			it "Should create a category" do
				expect { click_button submit }.to change(Category, :count).by(1)
			end
			describe "after saving the user" do
        		before { click_button submit }
        		let(:category) { Category.find_by_name('Movie') }
        		it { should have_selector('td', text: category.name) }
     		    end
			end

	  describe "with invalid information" do
    	  it "should not create a category" do
       	  expect { click_button submit }.not_to change(Category, :count)
          end
      end
    end

	describe "Edit category" do
		visit '/categories'
        let(:category) { Category.find_by_name('Movie') }
#        describe "when click edit link" do
#        	visit edit_category_path(category)
#        	it { should have_selector('text_field', text: category.name) }
#        end


	end

  end
