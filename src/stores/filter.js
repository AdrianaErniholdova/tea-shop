import { defineStore } from 'pinia'

export const useFilterStore = defineStore('filter', {
  state: () => ({
    type: [],
    caffeine: [],
    origin: [],
    sort: '',
    search: '',
  }),

  actions: {
    loadFromSession() {
      const data = sessionStorage.getItem('productFilters')
      if (data) {
        Object.assign(this, JSON.parse(data))
      }
    },

    saveToSession() {
      sessionStorage.setItem(
        'productFilters',
        JSON.stringify({
          type: this.type,
          caffeine: this.caffeine,
          origin: this.origin,
          sort: this.sort,
          search: this.search,
        })
      )
    },

    setFromRoute(query) {
      this.type = query.type ? query.type.split(',') : []
      this.caffeine = query.caffeine ? query.caffeine.split(',') : []
      this.origin = query.origin ? query.origin.split(',') : []
      this.sort = query.sort || ''
      this.search = query.search || ''
      this.saveToSession()
    },

    clear() {
      this.type = []
      this.caffeine = []
      this.origin = []
      this.sort = ''
      this.search = ''
      sessionStorage.removeItem('productFilters')
    },

    setSearch(query) {
      this.search = query
      this.saveToSession()
    },
  },
})
