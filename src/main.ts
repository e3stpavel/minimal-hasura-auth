import { createApp, h, provide } from 'vue'
import { createAuth0 } from '@auth0/auth0-vue'
import { createRouter, createWebHistory } from 'vue-router'
import { ApolloClient, InMemoryCache, createHttpLink } from '@apollo/client/core'
import { DefaultApolloClient } from '@vue/apollo-composable'

import nprogress from 'nprogress'
import routes from 'virtual:generated-pages'
import App from './App.vue'

import '@unocss/reset/tailwind.css'
import 'uno.css'

// router
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
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
    redirect_uri: window.location.href,
    audience: import.meta.env.VITE_AUTH_AUDIENCE,
  },
})

// apollo client
const link = createHttpLink({
  uri: import.meta.env.VITE_HASURA_GRAPHQL_ENDPOINT,
  fetch: async (uri, req) => {
    if (!req)
      throw new Error('RequestInit is not defined.')

    const token = await auth0.getAccessTokenSilently() // throws 'Login required' error
    const headers = new Headers(req.headers)

    if (token) {
      headers.set('Authorization', `Bearer ${token}`)

      // https://hasura.io/docs/latest/auth/authorization/index/#overview
      headers.set('X-Hasura-Role', auth0.isAuthenticated ? 'protected' : 'public')
      headers.set('X-Hasura-User-Id', auth0.user.value.sub ?? '')
    }

    req.headers = headers

    return fetch(uri, req)
  },
})

const cache = new InMemoryCache()

const client = new ApolloClient({
  link,
  cache,
})

const app = createApp({
  setup() {
    provide(DefaultApolloClient, client)
  },

  render: () => h(App),
})

app.use(auth0)
app.use(router)

app.mount('#app')
