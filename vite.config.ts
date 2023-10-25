/* eslint-disable no-undef */
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import { defineConfig, loadEnv } from 'vite'

const env = loadEnv(process.cwd(), '')
console.log(import.meta.url, 'HOLAMUNDOOOOO', env.VITE_REPO_NAME)

export default defineConfig({
  plugins: [vue()],
  base: env.VITE_REPO_NAME,
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
