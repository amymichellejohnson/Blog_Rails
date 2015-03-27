namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin",
                 email: "admin@admin.com",
                 password: "12345678",
                 password_confirmation: "12345678")
    admin.toggle!(:admin)
  end
end
