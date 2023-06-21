require 'cancancan'

class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @comment = @post.comments.new(author: current_user, **comment_params)
    puts @comment
    puts comment_params
    puts @post
    if @comment.save
      redirect_to posts_path(@post.author, @post), notice: 'Comment Created Successfully'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.find_by(post_id: @post.id)
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

 end
