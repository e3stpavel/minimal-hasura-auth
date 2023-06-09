<script setup lang="ts">
import { useAuth0 } from '@auth0/auth0-vue'
import { isDark, toggleDark } from '~/composables/dark'

const { logout, loginWithRedirect: userSignIn, user, isAuthenticated } = useAuth0()

function userSignOut() {
  return logout({ logoutParams: { returnTo: window.location.href } })
}
</script>

<template>
  <header>
    <nav class="bg-white border-b border-b-gray-200 px-4 lg:px-6 py-2.5 dark:(bg-slate-900 border-dark-100)">
      <div class="flex flex-wrap justify-between items-center">
        <RouterLink to="/" title="Go home" class="flex justify-start items-center">
          <span class="i-material-symbols-filter-vintage-outline-rounded mr-2 text-3xl" />
          <span class="self-center text-2xl font-semibold whitespace-nowrap">Authsura</span>
        </RouterLink>
        <div class="flex items-center lg:order-2 relative">
          <button type="button" class="w-8 h-8 mr-2 flex-center text-gray-500 rounded-lg hover:(text-gray-900 bg-gray-100) dark:(text-gray-400 hover:(text-white bg-gray-700) focus:ring-gray-600) focus:(ring-4 ring-gray-300)" @click="toggleDark()">
            <span class="sr-only">Toggle {{ isDark ? 'light' : 'dark' }} mode</span>
            <span :class="`text-lg ${isDark ? 'i-line-md-moon-filled-to-sunny-filled-loop-transition' : 'i-line-md-sunny-filled-loop-to-moon-alt-filled-loop-transition'}`" />
          </button>

          <button
            v-if="!isAuthenticated"
            type="button"
            class="sm:inline-flex flex-center text-white bg-blue-700 hover:bg-blue-800 focus:(ring-2 ring-blue-300 outline-none) font-medium rounded-lg text-xs px-3 py-1.5 dark:(bg-blue-600 hover:bg-blue-700 focus:ring-blue-800)"
            @click="userSignIn()"
          >
            <span class="i-material-symbols-login text-lg mr-2" />
            <span class="">Sign in</span>
          </button>

          <template v-else>
            <button
              type="button"
              class="sm:inline-flex flex-center text-blue-700 hover:(text-blue-800 underline bg-gray-100) focus:(ring-2 ring-blue-300 outline-none) font-medium rounded-lg text-xs px-3 py-1.5 dark:(text-blue-400 hover:(text-blue-300 bg-gray-700) focus:ring-blue-800)"
              @click="userSignOut()"
            >
              <span class="i-material-symbols-logout text-lg lg:mr-2" />
              <span class="hidden lg:block">Sign out</span>
            </button>

            <button id="user-menu-button" type="button" class="peer/user flex mx-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" aria-expanded="false">
              <span class="sr-only">Open user menu</span>
              <img
                class="w-8 h-8 rounded-full"
                :src="user.picture ?? 'https://flowbite.com/docs/images/people/profile-picture-5.jpg'"
                alt="user photo"
              >
            </button>

            <div id="dropdown" class="peer-focus-within/user:block absolute top-4 right-0 hidden z-50 my-4 w-56 text-base list-none bg-white rounded divide-y divide-gray-100 shadow dark:(bg-gray-700 divide-gray-600)">
              <div class="py-3 px-4">
                <span class="block text-sm font-semibold text-gray-900 dark:text-inherit">@{{ user.nickname }}</span>
                <span class="block text-sm font-light text-gray-500 truncate dark:text-gray-400">{{ user.email }}</span>

                <span :class="user.email_verified ? 'bg-green-100 text-green-800 dark:(bg-green-900 text-green-300)' : 'bg-red-100 text-red-800 dark:(bg-red-900 text-red-300)'" class="mt-2 inline-flex items-center  text-xs font-medium mr-2 px-2.5 py-0.5 rounded-full">
                  <span :class="user.email_verified ? 'bg-green-500' : 'bg-red-500'" class="w-2 h-2 mr-1 rounded-full" />
                  <span class="first-letter:uppercase">{{ `${user.email_verified ? '' : 'not'} verified` }}</span>
                </span>
              </div>
            </div>
          </template>
        </div>
      </div>
    </nav>
  </header>
</template>
