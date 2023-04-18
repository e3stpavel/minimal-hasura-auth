<script setup lang="ts">
import { useAuth0 } from '@auth0/auth0-vue'
import Header from '~/components/Header.vue'

const { isAuthenticated } = useAuth0()
</script>

<template>
  <Header />
  <main class="py-16 px-12 max-w-2/3 flex-center flex-col gap-y-8 text-center mx-auto">
    <h1 class="text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
      Do you know that {{ isAuthenticated ? 'now you\'ll be able to get invoices' : 'you will never get any invoice' }}?
    </h1>
    <p class="text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">
      Check it by sending the following query to the API
    </p>
    <code>
      <pre>aa</pre>
    </code>
  </main>
</template>
