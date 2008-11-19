class BlogPost < ActiveRecord::Base
  
  # more ways to do the same thing:
  # after_save do |blog_post|
  #   logger.debug "Saving a new blog post: #{blog_post.inspect}"
  # end
  # 
  # after_save :log_save
  # 
  def after_save
    log_save
  end
  
  def log_save
    logger.debug "Saving a blog post: #{self.inspect}"
  end
  
end
