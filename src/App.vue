<template>
  <TheNavigation />
  <RouterView />
  <BaseAlert />
  <TheFooter />
</template>

<script>
import TheNavigation from './components/TheNavigation.vue';
import TheFooter from './components/Footer.vue';
import { useCartStore } from '@/stores/cart';
import BaseAlert from '@/components/BaseAlert.vue'

export default {
  name: 'App',
  components: {
    TheNavigation,
    TheFooter,
    BaseAlert
  },

  mounted() {
    const cart = useCartStore();
    cart.loadFromLocalStorage();
  }
};
</script>
