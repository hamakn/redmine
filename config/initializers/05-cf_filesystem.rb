# filesystem autoconfig for Cloud Foundry
if ENV["VCAP_SERVICES"]
  vcap_services = JSON.parse(ENV["VCAP_SERVICES"])
  if (fs = vcap_services.values.flatten.find { |h| h["label"] =~ /filesystem/ })
    fs_info = fs["credentials"]["internal"]
    attachments_storage_path = File.join(fs_info["local_path"], fs_info["name"])
  end
end

ATTACHMENTS_STORAGE_PATH = attachments_storage_path || ""
