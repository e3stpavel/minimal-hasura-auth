<script setup lang="ts">
import { gql } from '@apollo/client/core'
import { useAuth0 } from '@auth0/auth0-vue'
import { useLazyQuery } from '@vue/apollo-composable'
import Header from '~/components/Header.vue'

interface Invoice {
  id: string
  date: Date
}

const { isAuthenticated } = useAuth0()
const { result, load, error, loading } = useLazyQuery(gql`
  query {
    invoices {
      date
      id
      created_at
      updated_at
      invoice_status {
        value
        comment
      }
      total_amount
      company {
        name
      }
    }
  }
`, null, { fetchPolicy: 'no-cache' })
</script>

<template>
  <Header />
  <main class="py-16 px-12 max-w-2/3 flex-center flex-col gap-y-8 text-center mx-auto">
    <h1 class="text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-inherit">
      Do you know that {{ isAuthenticated ? 'now you\'ll be able to get invoices' : 'you will never get any invoice' }}?
    </h1>
    <p class="text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">
      Check it by sending the following query to the API
    </p>
    <code class="text-left px-2 py-1.5 text-xs font-semibold text-gray-800 bg-gray-100 border border-gray-200 rounded-lg dark:(bg-gray-600 text-gray-100 border-gray-500)">
      <pre class="font-mono px-4 py-2">
query GetInvoices {
  invoices {
    date
    company_id
    id
    user_id
    amount
    status
    created_at
    updated_at
  }
}
</pre>
    </code>

    <div class="flex-center">
      <button type="button" :disabled="loading" class="text-white bg-blue-700 hover:bg-blue-800 focus:(ring-4 ring-blue-300 outline-none) font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:(bg-blue-600 hover:bg-blue-700 focus:ring-blue-800)" @click="load()">
        Send request ->
      </button>
      <button type="button" class="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 focus:(outline-none z-10 ring-4 ring-gray-200) bg-white rounded-lg border border-gray-200 hover:(bg-gray-100 text-blue-700) dark:(focus:ring-gray-700 bg-gray-800 text-gray-400 border-gray-600 hover:(text-white bg-gray-700))">
        View companies
      </button>
    </div>

    <template v-if="error">
      <div class="p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
        <span class="font-medium">Error occured!</span> {{ error.message }}.
      </div>
    </template>

    <template v-if="loading">
      <div role="status" class="space-y-2.5 animate-pulse max-w-lg">
        <div v-for="n in 6" :key="n" class="flex items-center w-full space-x-2">
          <div class="h-2.5 bg-gray-200 rounded-full dark:bg-gray-700 w-32" />
          <div class="h-2.5 bg-gray-300 rounded-full dark:bg-gray-600 w-24" />
          <div class="h-2.5 bg-gray-300 rounded-full dark:bg-gray-600 w-full" />
        </div>
        <span class="sr-only">Loading...</span>
      </div>
    </template>
    <p>{{ result }}</p>
  </main>
</template>
