<template>
  <!-- Filter Sidebar -->
  <div class="products_grid">
    <ProductCard v-for="product in products" :key="product.slug" :product="product" :category="category" @add-to-cart="addToCart" />
  </div>
</template>

<script>
import ProductCard from '@/components/ProductCard.vue';
import productsData from '../temp_data.json'
import { useCartStore } from '@/stores/cart'

export default {
  name: 'ProductsView',
  components: {
    ProductCard,
  },
  props: {
    category: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      products: [],
      cart: null,
    };
  },
  watch: {
    category() {
      this.fetchProducts()
    }
  },
  created() {
    this.fetchProducts(),
    this.cart = useCartStore()
  },
  methods: {
    fetchProducts() {
      const productType = productsData['product-category'].find(
        (type) => type.slug === this.category
      )

      if (!productType) {
        this.products = [];
        return;
      }

      if (this.category === 'tea') {
        const teaTypes = productType['tea-type'] || []
        this.products = teaTypes.flatMap((teaType) => teaType.products)
      }

      if (this.category === 'teapot') {
        const teapotTypes = productType['teapot-type'] || []
        this.products = teapotTypes.flatMap((teapotType) => teapotType.products)
      }
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