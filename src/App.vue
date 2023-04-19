<script setup lang="ts">
import Header from '~/components/Header.vue'
import Footer from '~/components/Footer.vue'
</script>

<template>
  <Header />
  <RouterView />
  <Footer />
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

body {
  --at-apply: font-sans dark:(text-light bg-slate-900);
}

#nprogress {
  pointer-events: none;
}

#nprogress .bar {
  --at-apply: bg-blue-800 dark:bg-blue-300;
  opacity: 0.75;
  position: fixed;
  z-index: 1031;
  top: 0;
  left: 0;
  width: 100%;
  height: 2px;
}
</style>
