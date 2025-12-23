import AboutView from '@/views/AboutView.vue'
import HomeView from '@/views/HomeView.vue'
import { createRouter, createWebHistory } from 'vue-router'
import ProductsView from '@/views/ProductsView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'about',
      component: AboutView
    },
    {
      path: '/cart',
      name: 'cart',
      component: () => import('@/views/CartView.vue')
    },
    {
      path: '/products/:category?',
      name: 'products',
      component: ProductsView,
      props: route => ({
        category: route.params.category || 'tea'
      })
    },
    {
      path: '/products/:category/:productSlug',
      name: 'ProductDetail',
      component: () => import('@/views/ProductDetailView.vue'),
      props: true
    }
  ]
})

export default router
