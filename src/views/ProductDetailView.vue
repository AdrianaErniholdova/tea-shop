<template>
  <div v-if="productsStore.loading" class="empty_state">
    Loading product...
  </div>
  <div v-else-if="!product" class="empty_state">
    Unable to load product.
  </div>
  <div v-else class="product_detail">
    <div class="product_detail_image">
      <img :src="productImage" :alt="product.name" />
    </div>
    <div class="product_detail_info">
      <div class="product_detail_header">
        <h1 class="product_detail_name">{{ product.name }}</h1>
        <p class="product_detail_subtitle">{{ product.subtitle }}</p>
      </div>
      <div class="product_detail_subheader">
        <div class="pricing">
          <p>100g pack = </p>
          <strong class="product_detail_price">{{ product.price }} €</strong>
        </div>
        <div class="stock_info">
          <span v-if="product.stock === 0" class="stock out_of_stock">Out of stock</span>
          <span v-else-if="product.stock === 1" class="stock only_one">Only 1 left</span>
          <span v-else-if="product.stock < 4" class="stock low_stock">Low in stock</span>
        </div>
        <div class="qty_btn">
          <QuantitySelector  v-model="quantity" :min="1" :max="maxAvailable" />
        </div>
        <div class="btn_icon">
          <button :disabled="product.stock === 0 || quantity > maxAvailable" @click="addToCart(product)">Add to Cart</button>
          <div class="wishlist_wrapper">
            <WishlistIcon :product="product" />
          </div>
        </div>
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
import { useUiStore } from '@/stores/ui'
import QuantitySelector from '@/components/QuantitySelector.vue';
import WishlistIcon from '@/components/WishlistIcon.vue';
import { useProductsStore } from '@/stores/products';

export default {
  name: 'ProductDetailView',
  components: {
    ProductCard,
    QuantitySelector,
    WishlistIcon
  },
  props: {
    productSlug: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      cart: null,
      ui: null,
      productsStore: null,
      quantity: 1,
    };
  },
  computed: {
    product() {
      return this.productsStore?.getProductBySlug(this.productSlug) || null
    },
    productImage() {
      if (!this.product) return ''
      return import.meta.env.BASE_URL + 'images/' + this.product.image_url
    },

    formattedDescription() {
      return this.product ? marked.parse(this.product.description) : ''
    },
    maxAvailable() {
      const itemInCart = this.cart.items.find(i => i.slug === this.product.slug)
      const inCartQty = itemInCart ? itemInCart.quantity : 0
      return this.product ? this.product.stock - inCartQty : 0
    },

    relatedProducts() {
      if (!this.product) return []
      
      return this.productsStore.products.filter(p =>
        p.slug !== this.product.slug &&
        p.typeSlug === this.product.typeSlug &&
        p.caffeineLevel === this.product.caffeineLevel
      ).slice(0, 4)
    }
  },

  async created() {
    this.cart = useCartStore()
    this.ui = useUiStore()
    this.productsStore = useProductsStore()

    await this.productsStore.fetchProducts()

    if (!this.product && !this.productsStore.loading) {
      this.ui.show('Product not found', 'error')
    }
  },
  methods: {
    addToCart(product) {
      if (this.quantity > this.maxAvailable || this.maxAvailable <= 0) return
      this.cart.addToCart(product, this.quantity)
      this.ui.show('Product added to cart', 'success')
      this.quantity = 1
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
  align-items: flex-start;
  margin-bottom: 2rem;
  gap: 1rem;
}

.pricing {
  display: flex;
  align-items: center;
  gap: 0.5rem;
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

.empty_state {
  text-align: center;
  font-size: 1.2rem;
  color: #555;
  margin: 3rem 0;
}

.stock_info {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.stock_info button:disabled {
  background: #ccc;
  cursor: not-allowed;
}

.stock {
  font-size: 1rem;
  font-weight: 500;
  margin: 0;
}

.out_of_stock {
  color: #d9534f;
}

.low_stock, .only_one {
  color: #f0ad4e;
}

.btn_icon {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 1rem;

}

.btn_icon button {
  width: 15rem;
}
</style>