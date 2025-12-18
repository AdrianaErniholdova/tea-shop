<template>
  <h1>Your cart</h1>
  <div v-for="(item, index) in cart.items" :key="index">
    <p>{{ item.name }} - {{ item.quantity }}</p>
    <button @click="cart.removeFromCart(item.slug)">Remove</button>
  </div>
  <p v-if="cart.items.length === 0">Your cart is empty.</p>
  <h3>Total price: {{ cart.totalPrice }}</h3>
</template>

<script>
import { useCartStore } from '@/stores/cart'

export default {
  name: 'CartView',
  setup() {
    const cart = useCartStore()
    return { cart }
  }
}
</script>