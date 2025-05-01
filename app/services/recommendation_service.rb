class RecommendationService
  def self.similar_videos(base_video)
    all_videos = Video.all.to_a
    base_tags = base_video.tags

    all_videos.sort_by do |video|
      -(video.tags & base_tags).size
    end.take(10)
  end
end
