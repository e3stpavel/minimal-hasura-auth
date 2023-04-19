<template>
  <main class="h-full py-16 px-6 md:(px-12 max-w-2/3) flex-center flex-col gap-y-8 text-center mx-auto">
    <h1 class="text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-inherit">
      Do you know that everyone can access companies, don't you?
    </h1>
    <p class="text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">
      I'm lazy to implement API request so just trust me :) Below the query
    </p>

    <code class="text-left px-2 py-1.5 text-xs font-semibold text-gray-800 bg-gray-100 border border-gray-200 rounded-lg dark:(bg-gray-600 text-gray-100 border-gray-500)">
      <pre class="font-mono px-4 py-2">
query GetCompanies {
  companies {
    id
    name
    updated_at
    created_at
  }
}
</pre>
    </code>

    <RouterLink to="/" class="text-white bg-blue-700 hover:bg-blue-800 focus:(ring-4 ring-blue-300 outline-none) font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:(bg-blue-600 hover:bg-blue-700 focus:ring-blue-800)">
      Bring me back ->
    </RouterLink>
  </main>
</template>
