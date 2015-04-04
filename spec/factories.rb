FactoryGirl.define do

  factory(:user) do
    name('Derp')
    email('derp@derp.com')
    password('derpderp')
    telephone("5034444444")
    admin(false)
  end

  factory(:admin, :class => User) do
    name('Admin')
    email('admin@admin.com')
    password('12345678')
    telephone('5034765356')
    admin(true)
  end

  factory(:post) do
    title("Philosophical thoughts on cats")
    blog("I spend hours each day comtemplating...")
  end

  

end
