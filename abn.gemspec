Gem::Specification.new do |s|
  s.name              = "abn"
  s.version           = "2.1.1"
  s.summary           = "a (very) small library for working with Australian Business Numbers."
  s.description       = "a (very) small library for working with Australian Business Numbers."
  s.license           = "MIT"
  s.author            = "James Healy"
  s.email             = ["jimmy@deefa.com"]
  s.homepage          = "http://github.com/yob/abn"
  s.rdoc_options      << "--title" << "ABN" << "--line-numbers"
  s.rubyforge_project = "yob-projects"
  s.test_files        = [ "spec/abn_spec.rb" ]
  s.files             = [ "lib/abn.rb", "CHANGELOG","MIT-LICENSE", "README.markdown" ]

  s.required_ruby_version = ">=1.9.3"

  s.add_development_dependency("rake")
  s.add_development_dependency("rspec", "~>3.0")
end
