<template>
  <div class="cart_item">
    <img :src="`/${item.image_url}`" :alt="item.name" class="cart_item_image" />
    <div class="cart_item_info">
      <div class="cart_item_name">{{ item.name }}</div>
    </div>

    <div class="cart_item_price">{{ item.price.toFixed(2) }} €</div>

    <div class="cart_item_quantity">
      <QuantitySelector
        v-model="localQuantity"
        :min="1"
        :max="item.stock"
      />
    </div>

    <div class="cart_item_total">{{ (item.price * localQuantity).toFixed(2) }} €</div>

    <div class="cart_item_remove">
      <button @click="$emit('remove')">✕</button>
    </div>
  </div>
</template>

<script>
import QuantitySelector from './QuantitySelector.vue'

export default {
  name: 'CartItem',
  components: {
    QuantitySelector,
  },
  props: {
    item: {
      type: Object,
      required: true,
    },
  },
  emits: ['updateQuantity', 'remove'],
  data() {
    return {
      localQuantity: Number(this.item.quantity) || 1,
    }
  },
  watch: {
    localQuantity(newVal) {
      this.$emit('updateQuantity', { slug: this.item.slug, quantity: Number(newVal) })
    },
    'item.quantity'(newVal) {
      this.localQuantity = Number(newVal)
    }
  }
};
</script>

<style scoped>
.cart_item {
  display: grid;
  grid-template-columns: 80px 1fr 80px 120px 80px 20px;
  align-items: center;
  gap: 1rem;
  padding: 1.5rem 0;
  border-bottom: 1px solid #e6eae6;
}

.cart_item_image {
  width: 60px;
  height: 60px;
  object-fit: contain;
}

.cart_item_name {
  font-weight: 500;
}

.cart_item_price,
.cart_item_total {
  font-weight: 500;
}

.cart_item_quantity button {
  background: none;
  border: none;
  font-size: 1rem;
  cursor: pointer;
}

.cart_item_remove {
  background: #f3f5f3;
  border: none;
  width: 26px;
  height: 26px;
  border-radius: 50%;
  cursor: pointer;
}
</style>