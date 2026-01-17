<template>
  <div class="cart">
    <h1 class="cart_title">Your cart</h1>
    <div class="cart_content">
      <div class="cart_items">
        <div v-if="cartItems.length === 0" class="cart_empty">
          <p>Your cart is empty.</p>
          <RouterLink to="/products" class="shop_link">
            Continue shopping
          </RouterLink>
        </div>
        <template v-else>
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
            @updateQuantity="updateQuantity"
            @remove="remove(item.slug)"
          />
        </template>
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

        <BaseButton
          class="checkout"
          :disabled="cartItems.length === 0"
          @click="$router.push('/checkout')"
          variant="primary"
        >
          Checkout
        </BaseButton>
      </div>
    </div>
  </div>
</template>

<script>
import { useCartStore } from '@/stores/cart'
import CartItem from '@/components/CartItem.vue';
import BaseButton from '@/components/Button.vue';

export default {
  name: 'CartView',
  components: {
    CartItem,
    BaseButton
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
    updateQuantity({ slug, quantity }) {
    this.cartStore.setQuantity(slug, quantity);
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
  background: white;
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

.summary_total {
  display: flex;
  justify-content: space-between;
  font-weight: 600;
  margin: 1.5rem 0;
}

.cart_empty {
  text-align: center;
  padding: 3rem 1rem;
  color: #6b6b6b;
}

.shop_link {
  display: inline-block;
  margin-top: 1rem;
  color: #405d1c;
  font-weight: 600;
  text-decoration: none;
}

.checkout:disabled {
  background: #b5b5b5;
  cursor: not-allowed;
  opacity: 0.7;
}

.checkout {
  width: 100%;
}
</style>