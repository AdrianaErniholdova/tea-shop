<template>
  <div class="product_card">
    <h5>{{ product.name }}</h5>
    <!-- product image -->
    <span>{{ product.price }}</span>
  </div>
</template>

<script>
export default {
  name: 'ProductCard',
  props: {
    product: {
      type: Object,
      required: true,
    },
  },
};
</script>