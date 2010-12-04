Gem::Specification.new do |s|
  s.name              = "abn"
  s.version           = "2.0.0"
  s.summary           = "a (very) small library for working with Australian Business Numbers."
  s.description       = "a (very) small library for working with Australian Business Numbers."
  s.author            = "James Healy"
  s.email             = ["jimmy@deefa.com"]
  s.homepage          = "http://github.com/yob/abn"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "ABN" << "--line-numbers"
  s.rubyforge_project = "yob-projects"
  s.test_files        = [ "spec/abn_spec.rb" ]
  s.files             = [ "lib/abn.rb", "CHANGELOG","MIT-LICENSE", "README.rdoc" ]

  s.add_development_dependency("rake")
  s.add_development_dependency("rcov")
  s.add_development_dependency("roodi")
  s.add_development_dependency("rspec", "~>2.0")
end
