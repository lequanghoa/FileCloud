class FileUpLoadsController < ApplicationController
  
def index
	
end  

  def new
  
   @folder=Folder.find_by_id(params[:id])
  	@fileupload=FileUpLoad.new
  end

  def create
    @fileupload=FileUpLoad.new(params[:file_up_load])
    
    
    if @fileupload.save
       redirect_to folder_path(@fileupload.folder_id)
     else
   
        render :action=>'new' 
    end  
  	end

  	def show
  	end

    def destroy
      
      @folder_id=FileUpLoad.find_by_id(params[:id]).folder_id

      FileUpLoad.find_by_id(params[:id]).destroy
      redirect_to folder_path(@folder_id) 
    end

    def download
       @fileupload=FileUpLoad.find(params[:id])
      if @fileupload.attach_content_type=="image/jpeg"
       send_file @fileupload.attach.path, :type => @fileupload.attach_content_type,:disposition=>'inline'
     else
      send_file @fileupload.attach.path, :type => @fileupload.attach_content_type
     end
    end
end
