class Comment
  attr_reader :text

  def text
    [
      Comment.pronouns.sample,
      Comment.nouns.sample,
      Comment.verbs.sample,
      Comment.adjectives.sample
    ].join(' ') +
    Comment.marks.sample
  end

  private

  def self.source
    YAML.load_file('comments.yml')
  end

  def self.pronouns
    source['pronouns']
  end

  def self.nouns
    source['nouns']
  end

  def self.verbs
    source['verbs']
  end

  def self.adjectives
    source['adjectives']
  end

  def self.marks
    source['marks']
  end
end
