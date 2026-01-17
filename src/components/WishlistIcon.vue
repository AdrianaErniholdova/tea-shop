<template>
  <SvgIcon
    type="mdi"
    :path="iconPath"
    class="wishlist-icon"
    @click.stop="toggle"
  />
</template>

<script>
import SvgIcon from '@jamescoyle/vue-icon'
import { mdiHeart, mdiHeartOutline } from '@mdi/js'
import { useWishlistStore } from '@/stores/wishlist'

export default {
  name: 'WishlistIcon',
  components: { SvgIcon },
  props: {
    product: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      wishlist: useWishlistStore()
    }
  },
  computed: {
    iconPath() {
      return this.wishlist.isInWishlist(this.product.slug)
        ? mdiHeart
        : mdiHeartOutline
    }
  },
  methods: {
    toggle() {
      this.wishlist.toggle(this.product)
    }
  },
  created() {
    this.wishlist.loadFromStorage()
  }
}
</script>


<style scoped>
.wishlist-icon {
  font-size: 1.6rem;
  width: 1em;
  height: 1em;
  cursor: pointer;
  color: #3a3a3a;
  transition: transform 0.15s ease, color 0.15s ease;
}

.wishlist-icon:hover {
  transform: scale(1.15);
  color: #3a3a3a;
}

@media (max-width: 768px) {
  .wishlist-icon {
    font-size: 1.2rem;
  }
}

@media (min-width: 1400px) {
  .wishlist-icon {
    font-size: 1.6rem;
  }
}

</style>
