Gem::Specification.new do |s|
  s.name              = "abn"
  s.version           = "1.0"
  s.summary           = "a (very) small library for working with Australian Business Numbers."
  s.description       = "a (very) small library for working with Australian Business Numbers."
  s.author            = "James Healy"
  s.email             = "jimmy@deefa.com"
  s.homepage          = "http://github.com/yob/abn/tree/master"
  s.has_rdoc          = true
  s.rdoc_options     << "--title" << "ABN" <<
                        "--line-numbers"
  s.test_files        = Dir.glob("spec/**/*_spec.rb")
  s.files             = Dir.glob("lib/**/*.rb") + ["MIT-LICENSE", "README.rdoc"]
end