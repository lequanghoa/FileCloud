require 'spec_helper'

describe "Filestreams" do
	subject{page}
     let(:folder){FactoryGirl.create(:folder)}
     let(:filestream){FactoryGirl.create(:filestream)}
     before do
    	 @file = folder.filestreams.build(folder_id:folder.id, attach_file_name:"bench_with_sea_view_sunset-wallpaper-1366x768.jpg",attach_content_type:"image/jpeg", attach_file_size:"515184")
    	 @file.save!
    	end
	describe "Filestream index page" do
		before { visit ('/filestreams/?folder_id='+ @file.folder_id.to_s)}

	  	it "Should has a add file button" do
		  page.should have_selector('input', value:"Add files...")
		end
		it "Should has a start upload button" do
		  page.should have_selector('input', value:"Start upload")
		end
		it "Should has a cancel upload button" do
		  page.should have_selector('input', value:"Cancel upload")
		end
		it "Should has a delete button" do
		  page.should have_selector('input', value:"Delete")
		end
		it "Should has a Back to folder button" do
		  page.should have_selector('input', value:"Back to Folder")
		end
	end

	describe "Should back to folder" do
		before { visit ('/filestreams/?folder_id='+ @file.folder_id.to_s)}
		#click_button "Back to Folder"
		let(:submit) { "Back to Folder" }
		it "should have_content" do
			binding.pry
			page.should have_content("Folder details")
		end
	end




end
