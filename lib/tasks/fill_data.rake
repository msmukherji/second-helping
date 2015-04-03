namespace :fill_data do
  desc "Make a user"
  task :user do
    FactoryGirl.create :user
  end
end
