# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @2.1.0
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "controllers" # @0.0.2
pin "fs" # @2.1.0
pin "path" # @2.1.0
pin "process" # @2.1.0
