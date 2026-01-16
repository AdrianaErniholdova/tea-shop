<template>
  <div class="search-bar">
    <input
      type="text"
      v-model="searchQuery"
      placeholder="Search products..."
      @keyup.enter="searchProducts"
    />
    <Button @click="searchProducts">Search</Button>
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
}

.search-bar button {
  padding: 5px 10px;
  background: #4c664e;
  color: white;
  border: none;
  cursor: pointer;
}
</style>
