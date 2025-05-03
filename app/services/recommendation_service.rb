require 'httparty'

class MlRecommendationService
  include HTTParty
  base_uri 'http://localhost:8001'

  def self.get_recommendations(video_id, top_k = 5)
    response = get("/recommend", query: { video_id: video_id, top_k: top_k })
  rescue => e
    Rails.logger.error("ML API Error: #{e}")
    []
  end
end