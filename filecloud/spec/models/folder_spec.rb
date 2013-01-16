require 'spec_helper'
require 'shoulda-matchers'

describe Folder do
	before do
		@folder = Folder.new(name: "Manchester United", description: "Old Trafford", category_id: 1)
	end

	subject {@folder}
	it {should respond_to(:name)}
	it {should respond_to(:description)}
	it {should respond_to(:category_id)}

	it {should be_valid}
	describe "when name is not presence" do
     before {@folder.name = " "}
     it { should_not be_valid }
  end
  describe "when name has been taken" do
	before do
		new_folder = @folder.dup
		new_folder.save
	end
	 it { should_not be_valid }
  end
  describe "when description is not presence" do
     before {@folder.description = " "}
     it { should_not be_valid }
  end
  describe "when category_id is not presence" do
     before {@folder.category_id = " "}
     it { should_not be_valid }
  end

end
