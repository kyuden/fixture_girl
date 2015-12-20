namespace :spec do
  namespace :fixture_girl do
    desc "Deletes the generated fixtures in spec/fixtures"
    task :clean do
      FileUtils.rm_f("tmp/fixture_girl.yml")
      FileUtils.rm_f(Dir.glob('spec/fixtures/*.yml'))
      puts "Automatically generated fixtures removed"
    end

    desc "Build the generated fixtures to spec/fixtures if dirty"
    task :build => :environment do
      ActiveRecord::Base.establish_connection(:test)
      Dir.glob(File.join(Rails.root, '{spec,test}', '**', 'fixture_girl.rb')).each{|file| require(file)}
    end

    desc "Clean and rebuild the generated fixtures to spec/fixtures"
    task :rebuild => [:clean, :build]
  end
end
