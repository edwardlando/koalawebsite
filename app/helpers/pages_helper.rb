module PagesHelper
	def createPost(postText, postAuthor)
		post = Parse::Object.new("Posts")
		post["author"] = postAuthor # might have to also set author hash
		post["authorHash"] = postAuthor # need to change this
		post["text"] = postText
		post["likes"] = 0
		post["comments"] = 0
		post["likeArr"] =[]
		post.save
	end

	def createComment(commentText, commentAuthor, commentPostId)
		comment = Parse::Object.new("Comments")
		comment["author"] = commentAuthor # might have to also set author hash
		comment["authorHash"] = commentAuthor # need to change this
		comment["text"] = commentText
		comment["postId"] = commentPostId
		comment["commentLikeArr"] = []
		comment["likes"] = 0
		puts comment
		puts "above is the comment before saving"
		comment.save
	end

	def getPosts
		posts = Parse::Query.new("Posts").tap do |q|
		  q.order_by = "createdAt"
		  q.order    = :descending
		  q.limit    = 30
		  #q.include  = "post"
		end.get
	end
end
