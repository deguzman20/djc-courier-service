namespace :user do
  desc "Update Geolocation of specific user"
  task :update_geolocation_of_specific_user => :environment do
    puts ApplicationController.set_current_user
    #User.update_geolocation_of_specific_user
    puts "asas"
  end
end