Dir.glob("#{Rails.root}/lib/*.rb") do |path|
  require File.expand_path(path)
end
