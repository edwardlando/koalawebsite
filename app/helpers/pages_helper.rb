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

	# increment the number of replies for that post !!!!!!!

	def getPosts
		posts = Parse::Query.new("Posts").tap do |q|
		  q.order_by = "createdAt"
		  q.order    = :descending
		  q.limit    = 3
		end.get
	end

	def getComments(postId)
		comments = Parse::Query.new("Comments").tap do |q|
		  q.eq("postId", postId)
		end.get
	end

end


# 	comments = Parse::Query.new("Comment").tap do |q|
#   q.eq("post", Parse::Pointer.new({
#     "className" => "Post",
#     "objectId"  => "8TOXdXf3tz"
#   }))
# end.get
