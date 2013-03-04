module TopicsHelper
  def join_tags(topic)
    topic.tags.map { |t| t.name }.join(", ")
  end
  def date_helper(timestamp, flag)
    if timestamp > 24.hours.ago
      time_ago_in_words(timestamp)
    else
      if flag == 1
        time_space = " - "
      else
        time_space = tag(:br)
      end
      (timestamp.strftime('%-d-%-m-%Y') + time_space + timestamp.strftime('%I:%M:%S %p')).html_safe
    end
  end
  def last_post_helper(topic)
    if topic.posts.count > 0
      date_helper(topic.posts.last.created_at, 0)
    else
      date_helper(topic.created_at, 0)
    end
  end
end