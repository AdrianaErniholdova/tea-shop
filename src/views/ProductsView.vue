<template>
  <!-- Filter Sidebar -->
  <div>
    <RouterLink v-for="product in products" :key="product.slug" :to="{ name: 'ProductDetail', params: { category: category, productSlug: product.slug } }">
      <ProductCard :product="product" />
    </RouterLink>
  </div>
</template>

<script>
import ProductCard from '@/components/ProductCard.vue';
import productsData from '../temp_data.json'

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
    };
  },
  created() {
    this.fetchProducts();
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
  },
};
</script>