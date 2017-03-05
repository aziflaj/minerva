class AddSomePosts < Sequel::Migration
  def up
    posts = DB[:posts]
    posts.insert(title: 'What is Lorem Ipsum?',
                 content: 'Lorem Ipsum is a dummy text...')
    posts.insert(title: 'Why do we use it?',
                 content: 'It is a long established fact that a reader...')
    posts.insert(title: 'Where does it come from?',
                 content: 'Contrary to popular belief, Lorem Ipsum is not simply...')
  end

  def down; end
end
