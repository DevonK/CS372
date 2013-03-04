module TopicsHelper
  def join_tags(topic)
    topic.tags.map { |t| t.name }.join(", ")
  end
  def date_helper(timestamp)
    if timestamp > 24.hours.ago
      time_ago_in_words(timestamp)
    else
      (timestamp.strftime('%-d-%-m-%Y') + tag(:br) + timestamp.strftime('%H:%M:%S')).html_safe
    end
  end
  def last_post_helper(topic)
    if topic.posts.count > 0
      date_helper(topic.posts.last.created_at)
    else
      date_helper(topic.created_at)
    end
  end
end