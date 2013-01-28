require 'spec_helper'

describe "Foldersharings" do
	describe "When signed in" do
		before { visit signin_path }
		let(:user){FactoryGirl.create(:user)}
			before do
				fill_in "Email", :with => user.email
				fill_in "Password", :with => user.password
				click_button "Sign in"
			end

			describe "Folder sharing page" do
				let(:folder){FactoryGirl.create(:folder)}
  			let(:user){FactoryGirl.create(:user)}
 				let(:foldersharing){FactoryGirl.create(:foldersharing)}
				before { visit ("/foldersharings/?folder_id="+folder.id.to_s) }
				it "should have share folders contents" do
					page.should have_selector('h1', :text => "Share folder to members")
			  end
				it "should have choose members contents" do
					page.should have_selector('h3', :text => "Choose members to share folder")
				end
				it "should have Select all members link" do
					page.should have_link('Select', :href => "#")
				end
				it "should have Deselect all members link" do
					page.should have_link('Deselect', :href => "#")
				end
				it "should have Back to Folder link" do
					page.should have_link('Back to Folder', :href => ("/folders/"+folder.id.to_s+"&?user_id="+user.id.to_s))
				end
				it "should have share button" do
					page.should have_selector('input', :value => "Share")
				end
				it "Number of users in DB should be equal to number of users in list + 1" do
						User.count - 1 == User.find_by_sql(["select id from users where id != ?",user.id]).length
				end
			end

			describe "Functions" do
				let(:folder){FactoryGirl.create(:folder)}
  			let(:user){FactoryGirl.create(:user)}
 				let(:foldersharing){FactoryGirl.create(:foldersharing)}
				before do
					visit ("/foldersharings/?folder_id="+folder.id.to_s)
					click_link('Select all')
				end
				it {save_and_open_page}
			end


#		describe "should select all members when click Select all", :js => true do
#			let(:user){FactoryGirl.create(:user)}
#			before do
#				visit ("/foldersharings/?folder_id="+folder.id.to_s)
#				click_link('Select all')
#			end
#				#it {save_and_open_page}
#			it "Check all members" do
#				@users= User.find_by_sql(["select id,name from users where id != ?",user.id])
#				@users.each do |u|
#					#check('activated[]')
#					my_box = find('#activated_')
#					binding.pry
#					my_box.should be_checked
#				end
#			end
#		end

#		describe "should deselect all members when click Deselect all" do
#			let(:user){FactoryGirl.create(:user)}
#			before {
#				visit ("/foldersharings/?folder_id="+folder.id.to_s)
#				click_link('Deselect all')
#			}
#			it "Uncheck all members" do
#				@users= User.find_by_sql(["select id,name from users where id != ?",user.id])
#				@users.each do |u|
#					uncheck('activated[]')
#				end
#			end
#		end

  end
end
