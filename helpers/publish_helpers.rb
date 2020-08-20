module PublishHelpers
  def is_published(article)
     return false if article.date > Time.now
     return false unless article.published?
     true
  end

  def next_published(cur)
    return nil if cur.nil?
    cur.blog_data.articles.select { |a| is_published(a) && a != cur }.reverse.find { |a| a.date >= cur.date }
  end

  def prev_published(cur)
    return nil if cur.nil?
    cur.blog_data.articles.select { |a| is_published(a) && a != cur }.find { |a| a.date <= cur.date }
  end

  def published_and_sorted(art)
    art.select { |a| is_published(a) }.sort { |a| a.date }
  end
end

