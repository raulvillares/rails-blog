module BlogPostHelper
  def blog_post_status_text(blog_post)
    if blog_post.draft?
      "draft"
    elsif blog_post.scheduled?
      "scheduled"
    elsif blog_post.published?
      "published"
    end
  end

  def blog_post_status_bg_color(blog_post)
    if blog_post.scheduled?
      "bg-blue-100"
    else
      "bg-gray-100"
    end
  end
end
