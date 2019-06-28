# По умолчанию запускаем только необходимых для тестов наблюдателей,
# то есть всех, кроме server.
# Для запуска всех: bundle exec guard -g default
scope groups: %w[specs server]

group 'specs' do
  # запускаем тесты и использованием Spring
  guard :rspec, cmd: 'bin/spring rspec' do
    require 'guard/rspec/dsl'
    dsl = Guard::RSpec::Dsl.new(self)

    # Файлы тестов
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir } # "spec/spec_helper.rb"
    watch(rspec.spec_support) { rspec.spec_dir } # %r{^#{rspec.spec_dir}/support/(.+)\.rb$}
    watch(rspec.spec_files) # %r{^#{rspec.spec_dir}/.+_spec\.rb$}

    # Дополнительные библиотеки
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files) # %r{^(lib/.+)\.rb$}

    # Файлы приложения
    rails = dsl.rails(view_extensions: %w[erb slim])
    dsl.watch_spec_files_for(rails.app_files) # %r{^app/(.+)\.rb$}
    dsl.watch_spec_files_for(rails.views) # %r{^app/(views/.+/[^/]*\.(?:erb|slim))$}

    watch(rails.controllers) { |m| rspec.spec.call("controllers/#{m[1]}_controller") } # %r{^app/controllers/(.+)_controller\.rb$}

    # Конфиги
    watch(rails.spec_helper)     { rspec.spec_dir } # "spec/rails_helper.rb"
    watch(rails.routes)          { "#{rspec.spec_dir}/controllers" } # "config/routes.rb"
    watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" } # "app/controllers/application_controller.rb"
  end

  guard :bundler do
    require 'guard/bundler'
    require 'guard/bundler/verify'
    helper = Guard::Bundler::Verify.new

    files = ['Gemfile']
    files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

    # Assume files are symlinked from somewhere
    files.each { |file| watch(helper.real_path(file)) }
  end

  guard 'spring', bundler: true do
    watch('Gemfile.lock')
    watch(%r{^config/})
    watch(%r{^spec/(support|factories)/})
    watch(%r{^spec/factory.rb})
  end
end

group 'server' do
  guard :rails do
    watch('Gemfile.lock')
    watch(%r{^(config|lib)/.*})
  end

  guard 'livereload' do
    extensions = {
      css: :css,
      scss: :css,
      sass: :css,
      js: :js,
      coffee: :js,
      html: :html,
      png: :png,
      gif: :gif,
      jpg: :jpg,
      jpeg: :jpeg,
    # less: :less, # uncomment if you want LESS stylesheets done in browser
  }

  rails_view_exts = %w(erb haml slim)

  # file types LiveReload may optimize refresh for
  compiled_exts = extensions.values.uniq
  watch(%r{public/.+\.(#{compiled_exts * '|'})})

  extensions.each do |ext, type|
    watch(%r{
      (?:app|vendor)
      (?:/assets/\w+/(?<path>[^.]+) # path+base without extension
      (?<ext>\.#{ext})) # matching extension (must be first encountered)
      (?:\.\w+|$) # other extensions
    }x) do |m|
      path = m[1]
      "/assets/#{path}.#{type}"
    end
  end

  # file needing a full reload of the page anyway
  watch(%r{app/views/.+\.(#{rails_view_exts * '|'})$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{config/locales/.+\.yml})
end
end
