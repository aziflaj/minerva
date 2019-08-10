class Post < Sequel::Model(DB)
  def validate
    super
    errors.add(:title, "can't be empty") if title.empty?
    errors.add(:content, "can't be empty") if content.empty?
  end
end
