class Video
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :tags, type: Array

  belongs_to :user

  include VideoUploader::Attachment(:video_file)
end
