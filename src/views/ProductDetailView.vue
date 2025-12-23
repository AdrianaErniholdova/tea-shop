<template>
  <div class="product_detail">
    <div class="product_detail_image">
      <img :src="product.image" :alt="product.name" />
    </div>
    <div class="product_detail_info">
      <h1 class="product_detail_name">{{ product.name }}</h1>
      <p class="product_description">{{ product.description }}</p>
      <strong class="product_detail_price">Price: {{ product.price }}€</strong>
      <button @click="cart.addToCart(product)">Add to Cart</button>
    </div>
  </div>
</template>

<script>
import productsData from '../temp_data.json'
import { useCartStore } from '@/stores/cart'

export default {
  name: 'ProductDetailView',
  props: {
    category: {
      type: String,
      required: true,
    },
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
    this.fetchProduct();
    this.cart = useCartStore();
  },
  methods: {
    fetchProduct() {
      const productType = productsData['product-category'].find(
        (type) => type.slug === this.category
      );

      if (!productType) {
        this.product = null;
        return;
      }

      let allProducts = [];

      if (this.category === 'tea') {
        const teaTypes = productType['tea-type'] || [];
        allProducts = teaTypes.flatMap((teaType) => teaType.products);
      }

      if (this.category === 'teapot') {
        const teapotTypes = productType['teapot-type'] || [];
        allProducts = teapotTypes.flatMap((teapotType) => teapotType.products);
      }

      this.product = allProducts.find(
        (prod) => prod.slug === this.productSlug
      ) || null;
    },
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

.product_description {
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