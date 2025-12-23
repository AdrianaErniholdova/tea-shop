<template>
  <TheNavigation />
  <RouterView />
</template>

<script>
import TheNavigation from './components/TheNavigation.vue';
import { useCartStore } from '@/stores/cart';

export default {
  name: 'App',
  components: {
    TheNavigation
  },

  mounted() {
    const cart = useCartStore();
    cart.loadFromLocalStorage();
  }
};
</script>
