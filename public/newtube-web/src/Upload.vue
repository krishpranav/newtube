<template>
  <div>
    <input v-model="title" placeholder="Title" />
    <input type="file" @change="uploadFile" />
    <button @click="upload">Upload</button>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import api from '@/services/api'

const title = ref('')
const file = ref(null)

const uploadFile = e => {
  file.value = e.target.files[0]
}

const upload = async () => {
  const formData = new FormData()
  formData.append('title', title.value)
  formData.append('video_file', file.value)

  await api.post('/videos', formData)
}
</script>
