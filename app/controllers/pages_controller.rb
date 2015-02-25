class PagesController < ApplicationController
	
    require 'parse-ruby-client'
    include PagesHelper

    before_filter :authenticate, :only => [:dashboard, :makePost, :makeComment]

	def home
	end
	def rules
	end
	def terms
	end
	def privacy
	end
	def dashboard
		@posts_and_comments = {}
		@posts = getPosts()

        #Get comments for each post and store in a dictionnary.
		@posts.each do |p|
			comments = getComments(p["objectId"])
			@posts_and_comments[p] = comments
		end
	end
	
	def makePost
		postText = params[:post][:post_text]
		postAuthor = params[:post][:post_author]

		createPost(postText,postAuthor)
		
		respond_to do |format|
	      format.html
	      format.js
	    end
	end
	def makeComment
		# need to also use the postId
		commentText = params[:comment][:comment_text]
		commentAuthor = params[:comment][:comment_author]
		commentPostId = params[:comment][:comment_postId]

		createComment(commentText,commentAuthor,commentPostId)
		
		respond_to do |format|
	      format.html
	      format.js
	    end
	end
end
