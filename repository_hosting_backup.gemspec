# -*- encoding: utf-8 -*-
require File.expand_path('../lib/repository_hosting_backup/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Utkarsh Kukreti"]
  gem.email         = ["utkarshkukreti@gmail.com"]
  gem.description   = %q{Backs up all repositories in your RepositoryHosting.com account into a folder}
  gem.summary       = %q{Backs up all repositories in your RepositoryHosting.com account into a folder}
  gem.homepage      = "https://github.com/utkarshkukreti/repository_hosting_backup"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "repository_hosting_backup"
  gem.require_paths = ["lib"]
  gem.version       = RepositoryHostingBackup::VERSION

  gem.add_dependency "slop"
  gem.add_dependency "mechanize"
end
