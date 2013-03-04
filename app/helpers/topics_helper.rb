module TopicsHelper
  def join_tags(topic)
    topic.tags.map { |t| t.name }.join(", ")
  end

  def last_post_helper(topic)
    if topic.posts.count > 0
      topic.posts.last.created_at
    else
      topic.created_at
    end
  end
end