class VideoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :tags, :created_at

  attribute :video_url do |object|
    object.video_file_url
  end
end
