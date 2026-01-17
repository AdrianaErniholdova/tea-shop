<template>
  <div class="products_page">

    <aside class="filter_sidebar">
      <h3>Filter</h3>
      <div class="filter_section">
        <p><strong>Tea Type</strong></p>
        <div v-for="type in productsStore.uniqueTypes" :key="type">
          <label>
            <input type="checkbox" :value="type" v-model="filter.type" id="type"/>
            {{ type }}
          </label>
        </div>
      </div>

      <div class="filter_section">
        <p><strong>Caffeine Level</strong></p>
        <div v-for="level in productsStore.uniqueCaffeineLevels" :key="level">
          <label>
            <input type="checkbox" :value="level" v-model="filter.caffeine" id="level"/>
            {{ level }}
          </label>
        </div>
      </div>

      <div class="filter_section">
        <p><strong>Origin</strong></p>
        <div v-for="origin in productsStore.uniqueOrigins" :key="origin">
          <label>
            <input type="checkbox" :value="origin" v-model="filter.origin" id="origin"/>
            {{ origin }}
          </label>
        </div>
      </div>

      <BaseButton @click="clearFilters" variant="primary" class="clear_filters">
        Clear Filters
      </BaseButton>
    </aside>

    <section class="products_section">

      <div class="sort_section">
        <div v-if="filter.search" class="search-title">
          Search results for "{{ filter.search }}"
        </div>
        <label for="sort">Sort by:</label>
        <select id="sort" v-model="filter.sort">
          <option value="priceLowHigh">Price: Low to High</option>
          <option value="priceHighLow">Price: High to Low</option>
          <option value="nameAZ">Name: A-Z</option>
          <option value="nameZA">Name: Z-A</option>
        </select>
      </div>

      <div class="products_grid">

        <div v-if="productsStore.loading" class="empty_state">
          Loading products...
        </div>
        <div v-else-if="productsStore.error" class="empty_state">
          {{ productsStore.error }}
        </div>
        <div v-else-if="!productsStore.error && filteredProducts.length === 0" class="empty_state">
          No products match your selection.
        </div>
        
        <ProductCard v-else
          v-for="product in sortedProducts"
          :key="product.slug"
          :product="product"
          @add-to-cart="addToCart"
        />
      </div>
    </section>
  </div>
</template>

<script>
import ProductCard from '@/components/ProductCard.vue'
import { useCartStore } from '@/stores/cart'
import { useFilterStore } from '@/stores/filter'
import { useProductsStore } from '@/stores/products'
import BaseButton from '@/components/Button.vue'

export default {
  name: 'ProductsView',
  components: {
    ProductCard,
    BaseButton
  },
  data() {
    return {
      cart: null,
      filter: null,
      productsStore: null,
    };
  },

  async created() {
    this.cart = useCartStore()
    this.filter = useFilterStore()
    this.filter.loadFromSession()
    this.filter.setFromRoute(this.$route.query)
    this.syncRoute()
    this.productsStore = useProductsStore()

    await this.productsStore.fetchProducts()
  },

  watch: {
    filter: {
      deep: true,
      handler() {
        this.filter.saveToSession()
        this.syncRoute()
      },
    },
  },

  computed: {
    filteredProducts() {
      return this.productsStore.products.filter(p => {
        return (
          (this.filter.type.length === 0 || this.filter.type.includes(p.typeName)) &&
          (this.filter.caffeine.length === 0 || this.filter.caffeine.includes(p.caffeineLevel)) &&
          (this.filter.origin.length === 0 || this.filter.origin.includes(p.originName)) &&
          (!this.filter.search || p.name.toLowerCase().includes(this.filter.search.toLowerCase()))
        )
      })
    },

    sortedProducts() {
      const list = [...this.filteredProducts]

      switch (this.filter.sort) {
        case 'priceLowHigh':
          return list.sort((a, b) => a.price - b.price)
        case 'priceHighLow':
          return list.sort((a, b) => b.price - a.price)
        case 'nameAZ':
          return list.sort((a, b) => a.name.localeCompare(b.name))
        case 'nameZA':
          return list.sort((a, b) => b.name.localeCompare(a.name))
        default:
          return list
      }
    },
  },

  methods: {
    addToCart(product) {
      this.cart.addToCart(product)
    },

    clearFilters() {
      this.filter.clear()
      this.$router.replace({ query: {} })
    },

    syncRoute() {
      const query = {}

      if (this.filter.type.length)
        query.type = this.filter.type.join(',')
      if (this.filter.caffeine.length)
        query.caffeine = this.filter.caffeine.join(',')
      if (this.filter.origin.length)
        query.origin = this.filter.origin.join(',')
      if (this.filter.sort)
        query.sort = this.filter.sort
      if (this.filter.search) query.search = this.filter.search
      this.$router.replace({ query })
    },
  },
}
</script>

<style scoped>
.products_page {
  display: flex;
  gap: 2rem;
  max-width: 1400px;
  margin: 6rem auto;
  padding: 0 2rem;
}

.filter_sidebar {
  flex: 1;
  max-width: 300px;
  background: #ffffff;
  padding: 1rem;
  border-radius: 4px;
}

.filter_section {
  margin-bottom: 1.5rem;
}

.products_section {
  flex: 4;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.sort_section {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.products_grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 0.5rem;
}

@media (max-width: 1100px) {
  .products_page {
    flex-direction: column;
  }
  .filter_sidebar {
    max-width: 100%;
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
  }
}

.search-title {
  max-width: 1300px;
  margin: auto;
  padding: 0 2rem;
  font-size: 1.2rem;
  font-weight: 500;
}
</style>