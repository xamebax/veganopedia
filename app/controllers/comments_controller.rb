class CommentsController < ApplicationController
  def create
    debugger
    Comment.create!(params[:comment].merge!(:product_id => params[:product_id]))
    redirect_to product_path(params[:product_id]), :notice => "Successfully added comment."
  end
end
