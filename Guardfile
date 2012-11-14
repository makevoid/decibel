guard 'sass', input: 'sass', output: 'public/css'
guard 'coffeescript', input: 'coffee', output: "public/js"
guard 'livereload' do
  watch(%r{views/.+\.(erb|haml|slim|md|markdown)})
  watch(%r{public/css/.+\.css})
  watch(%r{public/js/.+\.js})
end

# guard 'rspec', version: 2 do
#   watch(%r{^spec/.+_spec\.rb$})
#   watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
#   watch('spec/spec_helper.rb')  { "spec" }
# end