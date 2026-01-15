<template>
  <div class="products_page">

    <aside class="filter_sidebar">
      <h3>Filter</h3>
      <div class="filter_section">
        <p><strong>Tea Type</strong></p>
        <div v-for="type in uniqueTypes" :key="type">
          <label>
            <input type="checkbox" :value="type" v-model="filter.type" />
            {{ type }}
          </label>
        </div>
      </div>

      <div class="filter_section">
        <p><strong>Caffeine Level</strong></p>
        <div v-for="level in uniqueCaffeineLevels" :key="level">
          <label>
            <input type="checkbox" :value="level" v-model="filter.caffeine" />
            {{ level }}
          </label>
        </div>
      </div>

      <div class="filter_section">
        <p><strong>Origin</strong></p>
        <div v-for="origin in uniqueOrigins" :key="origin">
          <label>
            <input type="checkbox" :value="origin" v-model="filter.origin" />
            {{ origin }}
          </label>
        </div>
      </div>

      <button @click="clearFilters" class="clear_filters">Clear Filters</button>
    </aside>

    <section class="products_section">

      <div class="sort_section">
        <label for="sort">Sort by:</label>
        <select id="sort" v-model="filter.sort">
          <option value="priceLowHigh">Price: Low to High</option>
          <option value="priceHighLow">Price: High to Low</option>
          <option value="nameAZ">Name: A-Z</option>
          <option value="nameZA">Name: Z-A</option>
        </select>
      </div>

      <div class="products_grid">
        <ProductCard
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

export default {
  name: 'ProductsView',
  components: {
    ProductCard,
  },
  data() {
    return {
      products: [],
      cart: null,
      filter: null,
    };
  },

  async created() {
    this.cart = useCartStore()
    this.filter = useFilterStore()

    this.filter.loadFromSession()

    this.filter.setFromRoute(this.$route.query)

    this.syncRoute()

    await this.fetchProducts()
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
    uniqueTypes() {
      return [...new Set(this.products.map(p => p.typeName))].filter(Boolean)
    },
    uniqueCaffeineLevels() {
      return [...new Set(this.products.map(p => p.caffeineLevel))].filter(Boolean)
    },
    uniqueOrigins() {
      return [...new Set(this.products.map(p => p.originName))].filter(Boolean)
    },

    filteredProducts() {
      return this.products.filter(p => {
        return (
          (this.filter.type.length === 0 || this.filter.type.includes(p.typeName)) &&
          (this.filter.caffeine.length === 0 || this.filter.caffeine.includes(p.caffeineLevel)) &&
          (this.filter.origin.length === 0 || this.filter.origin.includes(p.originName))
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
    async fetchProducts() {
      try {       
        const res = await fetch('/api/products')
        this.products = await res.json()
      } catch (err) {
        console.error('Error fetching products:', err)
      }
    },

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
  background: #f3f5f3;
  padding: 1rem;
  border-radius: 4px;
}

.filter_section {
  margin-bottom: 1.5rem;
}

.clear_filters {
  margin-top: 1rem;
  padding: 0.5rem 1rem;
  background: #4b8f5d;
  color: #fff;
  border: none;
  cursor: pointer;
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
  grid-template-columns: repeat(3, 1fr);
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
</style>