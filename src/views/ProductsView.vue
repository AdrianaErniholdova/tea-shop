<template>
  <!-- Filter Sidebar -->
  <div class="products_grid">
    <ProductCard v-for="product in products" :key="product.slug" :product="product" @add-to-cart="addToCart" />
  </div>
</template>

<script>
import ProductCard from '@/components/ProductCard.vue'
import { useCartStore } from '@/stores/cart'

export default {
  name: 'ProductsView',
  components: {
    ProductCard,
  },
  data() {
    return {
      products: [],
      cart: null,
    };
  },
  created() {
    this.fetchProducts(),
    this.cart = useCartStore()
  },
  methods: {
    fetchProducts() {
      fetch('/api/products')
        .then(res => res.json())
        .then(data => {
          this.products = data
        })
        .catch(err => {
          console.error('Fetch products error:', err)
        })
    },
    addToCart(product) {
      this.cart.addToCart(product)
    },
  },
};
</script>

<style scoped>
.products_grid {
  display: flex;
  flex-wrap: wrap;
  align-items:center;
  justify-content: center;
  gap: 1rem;
  margin-bottom: 3rem;
  margin-top: 6rem;
}
</style>