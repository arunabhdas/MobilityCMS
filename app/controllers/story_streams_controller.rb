class StoryStreamsController < ApplicationController
  def index
      @category = Category.find(params[:category_id])
  end

  def new
      @category = Category.find(params[:category_id])
      @story_stream = @category.story_streams.new
  end

  def create
      @category = Category.find(params[:category_id])
      @story_stream = @category.story_streams.new(story_stream_params)
      if @story_stream.save
          flash[:success] = "Added story_stream"
          redirect_to category_story_streams_path
      else
         flash[:error] = "There was a problem adding that story stream"
         render action: :new
    end

  end

  private
  def story_stream_params
      params[:story_stream].permit(:content)
  end
end
