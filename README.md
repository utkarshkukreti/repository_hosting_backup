# RepositoryHostingBackup

Backs up all repositories in your RepositoryHosting.com account into a folder.

## Installation

From git HEAD

     git clone https://github.com/utkarshkukreti/repository_hosting_backup.git
     cd repository_hosting_backup
     bundle install
     rake install

Don't forget to run `rbenv rehash` if using rbenv.

or install using rubygems.org

    gem install repository_hosting_backup

## Usage

`cd` into a directory where you want all your repositories cloned.

Run `rh-backup -s <subdomain> -u <username> -p <password>`

All your repositories will be cloned or updated (if it's already cloned) in the current directory.

(Tested only on MRI 1.9.3)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
