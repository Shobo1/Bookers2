class PostImagesController < ApplicationController

	def new
		@post_image = Book.new
    end

    def create
        @post_image = Book.new
        @post_image.user_id = current_user.id
        if @post_image.save
          redirect_to post_images_path
        else
          render :new
        end
    end

    def index
	end

    def show
	    @post_image = Book.find(params[:id])
    end

	def destroy
	    @post_image = book.find(params[:id])
	    @post_image.destroy
	    redirect_to post_images_path
	end
    def about
    end
    private

    def post_image_params
        #params.require(:post_image).permit
    end
end