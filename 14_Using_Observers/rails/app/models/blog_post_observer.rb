class BlogPostObserver < ActiveRecord::Observer
  
  def after_create(created_post)
    created_post.logger.debug "creating a new blog post #{created_post.inspect}"
  end
  
end
