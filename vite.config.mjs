/* eslint-disable no-undef */
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import { defineConfig, loadEnv } from 'vite'

console.log(import.meta.url, 'HOLAMUNDOOOOO')
const env = loadEnv(process.cwd(), '')

export default defineConfig({
  plugins: [vue()],
  base: env.VITE_REPO_NAME ?? '/vue3-template/',
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
