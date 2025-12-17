<template>
  <div>
    <h5>{{ product.name }}</h5>
    <!-- product image -->
     <p>{{ product.description }}</p>
    <strong>Price: {{ product.price }}</strong>
  </div>
</template>

<script>
import productsData from '../temp_data.json'

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