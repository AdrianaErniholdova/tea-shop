<template>
  <div class="wishlist_page">
    <h1>My Wishlist</h1>

    <div v-if="wishlist.items.length === 0" class="empty_state">
      Your wishlist is empty.
    </div>

    <div v-else class="products_grid">
      <ProductCard
        v-for="product in wishlist.items"
        :key="product.slug"
        :product="product"
        @add-to-cart="addToCart"
      />
    </div>
  </div>
</template>

<script>
import { useWishlistStore } from '@/stores/wishlist'
import { useCartStore } from '@/stores/cart'
import ProductCard from '@/components/ProductCard.vue'

export default {
  name: 'WishlistView',
  components: { ProductCard },

  computed: {
    wishlist() {
      return useWishlistStore()
    }
  },

  methods: {
    addToCart(product) {
      const cart = useCartStore()
      cart.addToCart(product)
    }
  },

  created() {
    this.wishlist.loadFromStorage()
  }
}
</script>

<style scoped>
.wishlist_page {
  padding: 6rem;
  max-width: 1200px;
  margin: 0 auto;
  text-align: center;
}

.empty_state {
  font-size: 1.2rem;
  color: #666;
  text-align: center;
  margin-top: 2rem;
}
.products_grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 1.5rem;
  margin-top: 2rem;
}
</style>