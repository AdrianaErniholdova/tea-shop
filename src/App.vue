<template>
  <TheNavigation />
  <RouterView />
  <TheFooter />
</template>

<script>
import TheNavigation from './components/TheNavigation.vue';
import TheFooter from './components/Footer.vue';
import { useCartStore } from '@/stores/cart';

export default {
  name: 'App',
  components: {
    TheNavigation,
    TheFooter
  },

  mounted() {
    const cart = useCartStore();
    cart.loadFromLocalStorage();
  }
};
</script>
