class Video
  include Mongoid::Document
  include Mongoid::Timestamps

  include VideoUploader::Attachment(:video_file) 

  field :title, type: String
  field :description, type: String
  field :tags, type: Array
  field :video_file_data, type: Hash             
end
