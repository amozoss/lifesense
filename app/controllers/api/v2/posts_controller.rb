class Api::V2::PostsController < ApplicationController
  respond_to :json
  before_action :authenticate, only: [:create, :update, :destroy]

  def index
    respond_with Post.all
  end

  def show
    respond_with post
  end

  def create
    respond_with :api, status: :created, json: Post.create(post_params)
  end

	def update
    p = post_params
    tag = p["tag"]
    tag = p["tag"]["id"] if !tag.nil?
		respond_with post.update(title: p["title"], content: p["content"], tag_id: tag)
	end

  def destroy
    respond_with post.destroy
  end

  private 

  def post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :content, :title, tag: [:id])
  end


end
