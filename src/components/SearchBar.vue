<template>
  <div class="search-bar">
    <input
      type="text"
      id="search"
      v-model="searchQuery"
      placeholder="Search products..."
      @keyup.enter="searchProducts"
    />
  </div>
</template>

<script>
import Button from './Button.vue';
import { useFilterStore } from '@/stores/filter';

export default {
  name: 'SearchBar',
  components: { Button },
  data() {
    return {
      searchQuery: ''
    }
  },
  methods: {
    searchProducts() {
      if (!this.searchQuery) return

      const filter = useFilterStore()
      filter.search = this.searchQuery

      const query = { ...this.$route.query, search: this.searchQuery }
      this.$router.push({ path: '/products', query })

      this.searchQuery = ''
    }
  }
}
</script>

<style scoped>
.search-bar {
  display: flex;
  flex-direction: row;
}

.search-bar input {
  padding: 5px 10px;
  flex: 1;
  max-width: 150px;
  border: none;
  color: white !important;
  font-size: 14px;
  background-color: transparent;
}

.search-bar input::placeholder {
  color: white;
  opacity: 1;
}
</style>
