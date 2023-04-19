<script setup lang="ts">
import { gql } from '@apollo/client/core'
import { useAuth0 } from '@auth0/auth0-vue'
import { useLazyQuery } from '@vue/apollo-composable'

interface Company {
  id: string
  name: string
}

interface InvoiceStatus {
  value: 'paid' | 'unpaid'
  comment?: string
}

interface Invoice {
  id: string
  date: string
  company: Company
  total_amount: number
  invoice_status: InvoiceStatus
  updated_at: string
}

const { isAuthenticated } = useAuth0()
const { result, load, error, loading } = useLazyQuery<{ invoices: Array<Invoice> }>(gql`
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
  <main class="py-16 px-6 md:(px-12 max-w-2/3) flex-center flex-col gap-y-8 text-center mx-auto">
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
      <RouterLink to="/companies" class="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 focus:(outline-none z-10 ring-4 ring-gray-200) bg-white rounded-lg border border-gray-200 hover:(bg-gray-100 text-blue-700) dark:(focus:ring-gray-700 bg-gray-800 text-gray-400 border-gray-600 hover:(text-white bg-gray-700))">
        View companies
      </RouterLink>
    </div>

    <template v-if="error">
      <div class="p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
        <span class="font-medium">Error occured!</span> {{ error.message }}.
      </div>
    </template>

    <template v-else-if="loading">
      <div role="status" class="space-y-2.5 animate-pulse max-w-lg">
        <div v-for="n in 6" :key="n" class="flex items-center w-full space-x-2">
          <div class="h-2.5 bg-gray-200 rounded-full dark:bg-gray-700 w-32" />
          <div class="h-2.5 bg-gray-300 rounded-full dark:bg-gray-600 w-24" />
          <div class="h-2.5 bg-gray-300 rounded-full dark:bg-gray-600 w-full" />
        </div>
        <span class="sr-only">Loading...</span>
      </div>
    </template>

    <template v-else>
      <div v-if="result?.invoices.length === 0" class="p-4 mb-4 text-sm text-blue-800 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400" role="alert">
        <span class="i-material-symbols-emoticon text-2xl" /> No invoices were found!
      </div>

      <div v-else class="w-full grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
        <div v-for="invoice in result?.invoices" :key="invoice.id" class="flex-start flex-col p-4 bg-white border border-gray-200 rounded-lg shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">
          <div class="flex-center gap-x-2">
            <h6 class="text-lg font-medium">
              Invoice
            </h6>
            <span :class="invoice.invoice_status.value === 'unpaid' ? 'bg-red-100 text-red-800 dark:text-red-400 border-red-400' : 'bg-green-100 text-green-800 dark:text-green-400 border-green-400'" class="text-xs font-medium mr-2 px-2.5 py-0.5 rounded dark:bg-gray-700 border first-letter:uppercase">{{ invoice.invoice_status.value }}</span>
          </div>
          <h3 id="invoice-total-amount" class="text-2xl xl:text-3xl font-medium py-2 font-feature-settings-zero">
            {{ new Intl.NumberFormat(undefined, { notation: 'compact', compactDisplay: 'short', style: 'currency', currency: 'USD' }).format(invoice.total_amount) }}
          </h3>
          <div class="flex-center justify-start text-left">
            <p class="text-sm font-medium text-gray-500 dark:text-gray-400">
              Issued at: {{ new Intl.DateTimeFormat(undefined, { dateStyle: 'long' }).format(new Date(invoice.date)) }}
            </p>
            <!-- <span class="w-1 h-1 mx-1.5 bg-gray-500 rounded-full dark:bg-gray-400" />
            <a href="#" class="text-sm font-medium text-gray-500 dark:text-gray-400 underline hover:no-underline">Last update: 73 reviews</a> -->
          </div>
        </div>
      </div>
    </template>
  </main>
</template>

<style scoped>
#invoice-total-amount {
  -moz-font-feature-settings: "zero";
  -webkit-font-feature-settings: "zero";
  font-feature-settings: "zero";
}
</style>
