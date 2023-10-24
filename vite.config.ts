import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'node:url'
import { defineConfig, loadEnv } from 'vite'

const env = loadEnv(process.cwd(), '')

console.log(import.meta.url,"HOLAMUNDOOOOO")
export default defineConfig({
  plugins: [vue()],
  base: env.VITE_REPO_NAME ?? '/vue3-test/',
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
