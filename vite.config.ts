import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { env } from 'node:process'

console.log('holamundio')
console.log(env.URL, env.url, process.env)
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  base: env.VITE_REPO_NAME ?? '/vue3-template/',
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
