# Load the rails application
require File.expand_path('../application', __FILE__)

# remove dir created by vcap-staigng
FileUtils.rm_rf(File.join(Rails.root, "vendor", "plugins", "configure_assets"))
# for old vcap-staging https://github.com/cloudfoundry/vcap-staging/commit/65b7feb3#L1R106
FileUtils.rm_rf(File.join(Rails.root, "vendor", "plugins", "serve_static_assets"))

# Make sure there's no plugin in vendor/plugin before starting
vendor_plugins_dir = File.join(Rails.root, "vendor", "plugins")
if Dir.glob(File.join(vendor_plugins_dir, "*")).any?
  $stderr.puts "Plugins in vendor/plugins (#{vendor_plugins_dir}) are no longer allowed. " +
    "Please, put your Redmine plugins in the `plugins` directory at the root of your " +
    "Redmine directory (#{File.join(Rails.root, "plugins")})"
  exit 1
end

# Initialize the rails application
RedmineApp::Application.initialize!
