vcap_services = JSON.parse(ENV["VCAP_SERVICES"])
if (fs = vcap_services.values.flatten.find { |h| h["label"] =~ /filesystem/ })
  fs_info = fs["credentials"]["internal"]
  ATTACHMENTS_STORAGE_PATH = File.join(fs_info["local_path"], fs_info["name"])
else
  ATTACHMENTS_STORAGE_PATH = ""
end
