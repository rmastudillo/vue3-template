import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'

console.log(import.meta.url, 'HOLAMUNDOOOOO')
export default defineConfig({
  plugins: [vue()],
  base: '/vue3-test/',
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
