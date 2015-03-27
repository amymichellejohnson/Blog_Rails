FactoryGirl.define do

  factory(:user) do
    name('Derp')
    email('derp@derp.com')
    password('derpderp')
    admin(false)
  end

  factory(:admin, :class => User) do
    name('Admin')
    email('admin@admin.com')
    password('12345678')
    admin(true)
  end

  factory(:post) do
    title("Philosophical thoughts on cats")
    blog("I spend hours each day comtemplating...")
  end

  factory(:comment) do
    comment("I totally agree!")
    post
  end

end
