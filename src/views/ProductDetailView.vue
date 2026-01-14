<template>
  <div class="product_detail">
    <div class="product_detail_image">
      <img :src="`/${product.image_url}`" :alt="product.name" />
    </div>
    <div class="product_detail_info">
      <div class="product_detail_header">
        <h1 class="product_detail_name">{{ product.name }}</h1>
        <p class="product_detail_subtitle">{{ product.subtitle }}</p>
      </div>
      <div class="product_detail_subheader">
        <strong class="product_detail_price">{{ product.price }}€</strong>
        <button @click="cart.addToCart(product)">Add to Cart</button>
      </div>
    </div>
  </div>
  <div class="product_desc">
    <h4>Description</h4>
    <p>{{ product.description }}</p>
  </div>
</template>

<script>
import { useCartStore } from '@/stores/cart'

export default {
  name: 'ProductDetailView',
  props: {
    productSlug: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      product: null,
    };
  },
  created() {
    this.cart = useCartStore()
    this.fetchProduct()
  },
  methods: {
    async fetchProduct() {
      try {
        const res = await fetch('/api/products')
        const products = await res.json()
        this.product = products.find(p => p.slug === this.productSlug) || null
      } catch (err) {
        console.error('Error fetching product:', err)
        this.product = null
      }
    }
  },
};
</script>

<style scoped>
.product_detail {
  display: flex;
  gap: 5rem;
  max-width: 900px;
  margin: 200px auto;
  align-items: center;
}

.product_detail_image img {
  width: 400px;
  height: auto;
  border-radius: 8px;
}

.product_detail_info {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.product_detail_name {
  font-size: 2rem;
  margin-bottom: 1rem;
}

.product_detail_subtitle {
  font-size: 1rem;
  margin-bottom: 1.5rem;
  line-height: 1.5;
}

.product_detail_price {
  font-size: 1.5rem;
  margin-bottom: 1rem;
}

.product_detail button {
  padding: 0.8rem 1.5rem;
  font-size: 1rem;
  background-color: #333;
  color: #fff;
  border: none;
  cursor: pointer;
  width: fit-content;
}

.product_detail button:hover {
  background-color: #555;
}
</style>