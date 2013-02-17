module TopicsHelper
  def join_tags(topic)
    topic.tags.map { |t| t.name }.join(", ")
  end
end