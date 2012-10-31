module RepositoryHostingBackup
  class CLI
    def initialize(argv)
      if argv == %w{-v} || argv == %w{--version}
        puts RepositoryHostingBackup::VERSION
        exit 0
      end

      options = Slop.parse(argv, help: true) do
        on :s, :subdomain=, "Your main account's username (subdomain)", required: true
        on :u, :username=, "Your personal username", required: true
        on :p, :password=, "Your personal account's password", required: true
      end

      agent = Mechanize.new
      url = "https://#{options[:subdomain]}.repositoryhosting.com/login"

      puts "Fetching #{url}..."
      page = agent.get(url)

      login_form = page.form_with(action: "/session")
      login_form["session[username]"] = options[:username]
      login_form["session[password]"] = options[:password]
      submit_button = login_form.button_with(name: "commit")

      puts "Logging in as #{options[:username]}..."
      page = agent.submit(login_form, submit_button)

      git_repo_urls = page.body.scan(/ssh:\/\/git@.*?\.git\b/)
      puts "Found #{git_repo_urls.size} git repo_urlsitories"
      puts git_repo_urls.map { |url| "-- #{url}" }.join("\n")

      git_repo_urls.each do |url|
        folder_name = File.basename(url)
        if File.directory?(folder_name)
          puts "Folder #{folder_name} found"
          puts "Running `git pull` from #{folder_name}"
          success = system "(cd #{folder_name} && git pull)"
        else
          puts "No folder named #{folder_name} found"
          puts "Cloning from #{url}"
          success = system "git clone #{url} #{folder_name}"
        end
        if !success
          abort "Error! Process #{$?.pid} exited with status #{$?.exitstatus}."
        end
      end
    end
  end
end
