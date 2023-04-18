import { createApp } from 'vue'
import { createRouter, createWebHashHistory } from 'vue-router'

import nprogress from 'nprogress'
import routes from 'virtual:generated-pages'
import App from './App.vue'

import '@unocss/reset/tailwind.css'
import 'uno.css'

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes,
})

router.beforeEach((to, from) => {
  if (to.path === from.path)
    return

  nprogress.start()
})

router.afterEach(() => nprogress.done())

const app = createApp(App)

app.use(router)
app.mount('#app')
