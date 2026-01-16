<template>
    <div class="thank-you">
        <h1>Thank You</h1>
        <h3>Your order has been placed successfully!</h3>
        <p>In case you forgot to order something:</p>
        <router-link to="/products">
            <Button>Continue Shopping</Button>
        </router-link>
        <p>Or:</p>
        <Button @click="goHome">Go Home</Button>
    </div>
</template>

<script>
import Button from '@/components/Button.vue';
import { useOrderStore } from '@/stores/order'

export default {
  name: "ThankYou",
  components: { Button },
  data() {
    return {}
  },
  methods: {
    goHome() {
      this.$router.push('/')
    }
  },
  mounted() {
    const orderStore = useOrderStore();
    if (!orderStore.orderCompleted) {
      this.$router.replace('/');
    } else {
        orderStore.resetOrder();
    }
  }
}
</script>

<style scoped>
.thank-you {
    text-align: center;
    margin: 100px 0px 500px 0px;
    background-color: antiquewhite;
    max-width: 1300px;
    margin-left: auto;
    margin-right: auto;
    border-radius: 50px;
    padding: 50px;
}
</style>