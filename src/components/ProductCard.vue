<template>
  <div class="product_card">
    <div class="product_card_image_container">
      <img :src="product.image" :alt="product.name" class="product_card_image"/>
    </div>
    <div class="product_card_content">
      <h5>{{ product.name }}</h5>
      <span>{{ product.price }}</span>
    </div>
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

<style scoped>
.product_card {
  background: #fafbf9;
  overflow: hidden;
  transition: all 0.4s ease;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 300px;
  margin: 0 auto;
}

.product_card:hover {
  /*transform: translateY(-8px);*/
  box-shadow: 0 16px 40px rgba(45, 58, 46, 0.12);
}

.product_card_image_container {
  position: relative;
  width: 80%;
  aspect-ratio: 1;
  overflow: hidden;
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
</style>