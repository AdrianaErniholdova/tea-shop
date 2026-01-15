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
        <div class="pricing">
          <p>100g pack = </p>
          <strong class="product_detail_price">{{ product.price }}€</strong>
        </div>
        <button @click="cart.addToCart(product)">Add to Cart</button>
      </div>
    </div>
  </div>
  <hr />
  <div class="product_description" v-html="formattedDescription"></div>
  <hr />
  <div v-if="relatedProducts.length" class="related_products">
    <h2>Related Products</h2>
    <div class="products_grid">
      <ProductCard
        v-for="p in relatedProducts"
        :key="p.slug"
        :product="p"
        @add-to-cart="cart.addToCart(p)"
      />
    </div>
  </div>
</template>

<script>
import { useCartStore } from '@/stores/cart'
import { marked } from 'marked'
import ProductCard from '@/components/ProductCard.vue';

export default {
  name: 'ProductDetailView',
  components: {
    ProductCard,
  },
  props: {
    productSlug: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      product: null,
      relatedProducts: [],
    };
  },
  computed: {
    formattedDescription() {
      return this.product
        ? marked.parse(this.product.description)
        : ''
    }
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

        if (this.product) {
          this.relatedProducts = products.filter(p =>
            p.slug !== this.product.slug &&
            p.typeSlug === this.product.typeSlug &&
            p.caffeineLevel === this.product.caffeineLevel
          )
          .slice(0, 4)
        } else {
          this.relatedProducts = []
        }
      } catch (err) {
        console.error('Error fetching product:', err)
        this.product = null
        this.relatedProducts = []
      }
    }
  },
};
</script>

<style scoped>
.product_detail {
  display: flex;
  gap: 5rem;
  max-width: 1300px;
  margin: 200px auto 100px auto;
  align-items: center;
  justify-content: center;
}

.product_detail_image img {
  width: 400px;
  height: auto;
  margin-left: 6rem;
}

.product_detail_info {
  flex: 1;
  display: flex;
  flex-direction: column;
  max-width: 500px;
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

.product_detail_subheader {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  margin-bottom: 2rem;
}

.pricing {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 1rem;
}

.product_description {
  max-width: 1400px;
  margin: 50px auto 4rem;
  padding: 0 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.product_description :deep(h2) {
  font-family: var(--font-sans);
  font-size: 1.1rem;
  margin-top: 1.5rem;
}

@media (max-width: 1100px) {
  .product_detail {
    flex-direction: column;
    margin: 150px auto 50px auto;
    padding: 0 2rem;
  }
  .product_detail_subheader {
    align-items: center;
  }
  .product_detail_image img {
    width: 100%;
    max-width: 400px;
    margin-left: 0;
  }
}

.related_products {
  margin: 4rem 2rem;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.products_grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  gap: 1rem;
  margin-top: 2rem;
  max-width: 1300px;
}
</style>