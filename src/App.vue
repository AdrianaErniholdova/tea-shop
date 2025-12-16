<template>
  <TheNavigation />
  <RouterView :key="$route.fullPath" />
</template>

<script>
import TheNavigation from './components/TheNavigation.vue';

export default {
  name: 'App',
  components: {
    TheNavigation
  },
};
</script>
