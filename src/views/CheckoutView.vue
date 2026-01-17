<template>
  <div class="checkout_page">
    <h1>Checkout</h1>

    <div class="checkout_container">
      <form @submit.prevent="submitOrder" class="checkout_form">
        <label>
          Name
          <input type="text" v-model="form.name" id="name" name="name" required />
        </label>

        <label>
          Email
          <input type="email" v-model="form.email" id="email" name="email" required />
        </label>

        <h3>Order Summary</h3>
        <div class="checkout_items">
          <div v-for="item in cartStore.items" :key="item.slug" class="checkout_item">
            <span>{{ item.name }}</span>
            <span>{{ item.quantity }} × {{ item.price }} € = {{ item.quantity * item.price }}€</span>
          </div>
        </div>

        <div class="checkout_total">
          <strong>Total: {{ cartStore.totalPrice }}€</strong>
        </div>

        <BaseButton variant="primary" type="submit"> Place Order </BaseButton>
      </form>
    </div>
  </div>
</template>

<script>
import { useCartStore } from '@/stores/cart'
import { useOrderStore } from '@/stores/order'
import BaseButton from '@/components/Button.vue'

export default {
  name: 'CheckoutView',
  components: { BaseButton },
  data() {
    return {
      form: {
        name: '',
        email: ''
      },
      cartStore: null,
      orderStore: null,
    }
  },
  created() {
    this.cartStore = useCartStore()
    this.orderStore = useOrderStore()
  },
  mounted() {
    if (!this.cartStore.items.length) {
      this.$router.replace('/cart') 
    }
  },
  methods: {
    async submitOrder() {
      const result = await this.orderStore.createOrder(
        this.form.name,
        this.form.email
      )

      if (result.success) {
        this.$router.push('/thank-you')
      }
    }
  }
}
</script>

<style scoped>
.checkout_page {
  max-width: 800px;
  margin: 6rem auto;
  padding: 0 2rem;
}

.checkout_container {
  background: #ffffff;
  padding: 2rem;
  border-radius: 6px;
}

.checkout_form h2 {
  margin-top: 1.5rem;
  margin-bottom: 1rem;
}

.checkout_form label {
  display: flex;
  flex-direction: column;
  margin-bottom: 1rem;
  font-weight: 500;
}

.checkout_form input {
  padding: 0.5rem;
  font-size: 1rem;
  border-radius: 4px;
  background-color: #f8f7f3;
  border: 1px solid #ccc;
}

.checkout_items {
  margin: 1rem 0;
}

.checkout_item {
  display: flex;
  justify-content: space-between;
  margin-bottom: 0.5rem;
}

.checkout_total {
  margin-top: 1rem;
  margin-bottom: 1rem;
  font-size: 1.2rem;
  font-weight: 600;
}
</style>
