FactoryGirl.define do
  factory(:user) do
    email('derp@derp.com')
    password('derpderp')
  end
  factory(:post) do
    title("Philosophical thoughts on cats")
    blog("I spend hours each day comtemplating...")
  end

end
