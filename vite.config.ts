import path from 'node:path'
import { defineConfig } from 'vite'

import vue from '@vitejs/plugin-vue'
import pages from 'vite-plugin-pages'
import unocss from 'unocss/vite'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    pages(),
    unocss(),
  ],
  resolve: {
    alias: {
      '~/': `${path.resolve(__dirname, 'src')}/`,
    },
  },
  server: {
    port: 3000,
  },
})
