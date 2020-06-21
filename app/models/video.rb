class Video < ApplicationRecord
  mount_uploader :file_name, VideoUploader
end
