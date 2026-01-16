<template>
  <div class="checkout_page">
    <h1>Checkout</h1>

    <div class="checkout_container">
      <form @submit.prevent="submitOrder" class="checkout_form">
        <label>
          Name
          <input type="text" v-model="form.name" required />
        </label>

        <label>
          Email
          <input type="email" v-model="form.email" required />
        </label>

        <h3>Order Summary</h3>
        <div class="checkout_items">
          <div v-for="item in cartStore.items" :key="item.slug" class="checkout_item">
            <span>{{ item.name }}</span>
            <span>{{ item.quantity }} × {{ item.price }}€ = {{ item.quantity * item.price }}€</span>
          </div>
        </div>

        <div class="checkout_total">
          <strong>Total: {{ cartStore.totalPrice }}€</strong>
        </div>

        <button type="submit">Place Order</button>
      </form>
    </div>
  </div>
</template>

<script>
import { useCartStore } from '@/stores/cart'
import { useUiStore } from '@/stores/ui'

export default {
  name: 'CheckoutView',
  data() {
    return {
      form: {
        name: '',
        email: ''
      },
      loading: false
    }
  },
  computed: {
    cartStore() {
      return useCartStore()
    }
  },
  methods: {
    async submitOrder() {
      if (!this.cartStore.items.length) {
        return
      }

      this.loading = true

      const payload = {
        customerName: this.form.name,
        customerEmail: this.form.email,
        items: this.cartStore.items.map(item => ({
          teaId: item.id,
          quantity: item.quantity,
          price: item.price
        })),
        total: this.cartStore.totalPrice
      }

      try {
        const res = await fetch('/api/orders', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        })

        if (!res.ok) throw new Error('Failed to create order')

        const data = await res.json()

        this.cartStore.clearCart()
        this.$router.push('/')

      } catch (err) {
        console.error(err)
      
        const ui = useUiStore()
        ui.show('Failed to place order. Please try again.', 'error')
        
      } finally {
        this.loading = false
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
  background: #f3f5f3;
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
  font-size: 1.2rem;
  font-weight: 600;
}

button[type="submit"] {
  margin-top: 1.5rem;
  padding: 0.8rem 1.5rem;
  font-size: 1rem;
  background: #4b8f5d;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 4px;
}

button[type="submit"]:hover {
  background: #3d7a4a;
}
</style>
