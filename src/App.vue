<script setup lang="ts">
</script>

<template>
  <RouterView />
</template>

<style>
@supports (scrollbar-gutter: stable) {
  html {
    scrollbar-gutter: stable;
  }
}

html {
  font-synthesis: none;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-text-size-adjust: 100%;
  min-height: calc(100% + env(safe-area-inset-top));
}

.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
