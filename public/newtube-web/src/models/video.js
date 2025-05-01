export default class Video {
  constructor(data) {
    this.id = data.id
    this.title = data.title
    this.description = data.description
    this.tags = data.tags || []
    this.videoUrl = data.video_url
  }
}
