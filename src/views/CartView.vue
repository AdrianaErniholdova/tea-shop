<template>
  <div class="cart">
    <h1 class="cart_title">Your cart</h1>
    <div class="cart_content">
      <div class="cart_items">
        <div class="cart_header">
          <span>Product</span>
          <span>Price</span>
          <span>Quantity</span>
          <span>Total</span>
        </div>

        <CartItem
          v-for="item in cartItems"
          :key="item.slug"
          :item="item"
          @increment="increment(item.slug)"
          @decrement="decrement(item.slug)"
          @remove="remove(item.slug)"
        />
      </div>

      <div class="cart_summary">
        <h2>Order Summary</h2>
        <div class="summary_row">
          <span>Subtotal:</span>
          <span>{{ totalPrice }}€</span>
        </div>
        <div class="summary_row">
          <span>Shipping:</span>
          <span>Free</span>
        </div>
        <div class="summary_total">
          <span>Total:</span>
          <span>{{ totalPrice }}€</span>
        </div>

        <button class="checkout">Checkout</button>
      </div>
    </div>
  </div>
</template>

<script>
import { useCartStore } from '@/stores/cart'
import CartItem from '@/components/CartItem.vue';

export default {
  name: 'CartView',
  components: {
    CartItem,
  },
  data() {
    return {
      cartStore: null,
    }
  },
  computed: {
    cartItems() {
      return this.cartStore.items;
    },
    totalPrice() {
      return this.cartStore.totalPrice;
    }
  },
  methods: {
    increment(slug) {
      this.cartStore.incrementQuantity(slug);
    },
    decrement(slug) {
      this.cartStore.decrementQuantity(slug);
    },
    remove(slug) {
      this.cartStore.removeFromCart(slug);
    }
  },
  created() {
    this.cartStore = useCartStore();
    this.cartStore.loadFromLocalStorage();
  }
}
</script>

<style scoped>
.cart {
  max-width: 1400px;
  margin: 0 auto;
  padding: 8rem 2rem 4rem;
}

.cart_title {
  text-align: center;
  margin-bottom: 3rem;
}

.cart_content {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 3rem;
}

.cart_header {
  display: grid;
  grid-template-columns: 1fr 100px 140px 100px;
  font-size: 1rem;
  color: #7a7a7a;
  padding-bottom: 1rem;
  border-bottom: 1px solid #e6eae6;
}

.cart_summary {
  background: #f3f5f3;
  padding: 2rem;
  border-radius: 4px;
  height: fit-content;
}

.cart_summary h2 {
  margin-bottom: 1.5rem;
}

.summary_row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 0.8rem;
}

.free {
  color: #4b8f5d;
}

.summary_coupon {
  background: none;
  border: none;
  color: #4b8f5d;
  margin: 1rem 0;
  cursor: pointer;
}

.summary_total {
  display: flex;
  justify-content: space-between;
  font-weight: 600;
  margin: 1.5rem 0;
}

.checkout {
  width: 100%;
  padding: 1rem;
  background: #4b8f5d;
  color: white;
  border: none;
  cursor: pointer;
}
</style>