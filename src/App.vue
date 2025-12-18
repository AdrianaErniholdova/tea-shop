<template>
  <TheNavigation />
  <RouterView :key="$route.fullPath" />
</template>

<script>
import TheNavigation from './components/TheNavigation.vue';
import { useCartStore } from '@/stores/cart';

export default {
  name: 'App',
  components: {
    TheNavigation
  },

  setup() {
    const cart = useCartStore();
    cart.loadFromLocalStorage();
  }
};
</script>
