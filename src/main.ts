import { createApp } from 'vue'
import { createAuth0 } from '@auth0/auth0-vue'
import { createRouter, createWebHashHistory } from 'vue-router'

import nprogress from 'nprogress'
import routes from 'virtual:generated-pages'
import App from './App.vue'

import '@unocss/reset/tailwind.css'
import 'uno.css'

// router
const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes,
})

// loading bar
router.beforeEach((to, from) => {
  if (to.path === from.path)
    return

  nprogress.start()
})

router.afterEach(() => nprogress.done())

// auth0
const auth0 = createAuth0({
  domain: import.meta.env.VITE_AUTH_DOMAIN,
  clientId: import.meta.env.VITE_AUTH_CLIENT_ID,
  authorizationParams: {
    redirect_uri: window.location.origin,
    audience: import.meta.env.VITE_AUTH_AUDIENCE,
  },
})

const app = createApp(App)

app.use(router)
app.use(auth0)

app.mount('#app')
