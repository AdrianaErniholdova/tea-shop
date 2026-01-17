<template>
  <div class="product_card" @click="goToDetail">
    <div class="product_card_image_container">
      <div class="wishlist_wrapper">
        <WishlistIcon :product="product" />
      </div>
      <img :src="`/${product.image_url}`" :alt="product.name" class="product_card_image"/>
      <div class="product_card_overlay">
        <Button variant="primary" @click.stop="addToCart" :disabled="product.stock === 0 || cartQuantity >= product.stock">
          Add to cart
        </Button>
      </div>
    </div>
    <div class="product_card_content">
      <h5>{{ product.name }}</h5>
        <div class="product_card_price_stock">
          <span>{{ product.price }} €</span>

          <p v-if="product.stock === 0" class="stock out_of_stock">Out of stock</p>
          <p v-else-if="product.stock === 1" class="stock only_one">Only 1 left</p>
          <p v-else-if="product.stock > 1 && product.stock < 4" class="stock low_stock">Low in stock</p>
        </div>
    </div>
  </div>
</template>

<script>
import Button from './Button.vue';
import { useUiStore } from '@/stores/ui'
import { useCartStore } from '@/stores/cart'
import WishlistIcon from './WishlistIcon.vue';

export default {
  name: 'ProductCard',
  components: {
    Button,
    WishlistIcon
  },
  props: {
    product: {
      type: Object,
      required: true,
    },
  },
  emits: ['add-to-cart'],
  computed: {
    cartQuantity() {
      const cart = useCartStore()
      const item = cart.items.find(i => i.slug === this.product.slug)
      return item ? item.quantity : 0
    }
  },
  methods: {
    goToDetail() {
      this.$router.push({
        name: 'product-detail',
        params: {
          productSlug: this.product.slug,
        },
      })
    },
    addToCart() {
      if (this.product.stock === 0 || this.cartQuantity >= this.product.stock) return;

      this.$emit('add-to-cart', this.product)

      const ui = useUiStore()
      ui.show('Product added to cart', 'success')
    },
  },
};
</script>

<style scoped>
.product_card {
  background: #fafbf9;
  transition: all 0.4s ease;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 400px;
}

.product_card:hover {
  transform: translateY(-8px);
  box-shadow: 0 16px 40px rgba(45, 58, 46, 0.12);
}

.product_card_image_container {
  position: relative;
  width: 80%;
  aspect-ratio: 1;
  margin-top: 2rem;
}

.product_card_image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.6s ease;
}

.product_card_content {
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.75rem;
  flex-grow: 1;
}

.product_card_content h5 {
  font-size: 1.1rem;
  font-weight: 600;
  color: #2d3a2e;
  line-height: 1.4;
  margin: 0;
  font-family: var(--font-sans, 'Segoe UI', sans-serif);
  letter-spacing: -0.01em;
}

.product_card_content span {
  font-size: 0.9rem;
  color: #6b7569;
  font-weight: 500;
}

@media (max-width: 768px) {
  .product-card_content {
    padding: 1.25rem;
  }
  
  .product_card_content h5 {
    font-size: 1rem;
  }

  .product_card_content span {
    font-size: 0.85rem;
  }
}

.product_card_overlay {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: transparent;
  opacity: 0;
  pointer-events: none;
  transition: opacity 0.35s ease;
}

.product_card:hover .product_card_overlay {
  opacity: 1;
  pointer-events: auto;
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

.product_card_overlay button:disabled {
  display: none;
}

.product_card_price_stock {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 0.5rem;
}

.wishlist_wrapper {
  position: absolute;
  top: 1px;
  right: 1px;
  z-index: 3;
}

</style>