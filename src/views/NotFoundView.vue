<template>
    <div class="not-found">
        <h3>404</h3>
        <h1>Page Not Found</h1>
        <p>The page you are looking for does not exist.</p>
        <router-link to="/">
            <Button>Back to home</Button>
        </router-link>
    </div>
</template>

<script>
import Button from '@/components/Button.vue';

export default {
  name: "NotFound",
  components: { Button }
}
</script>

<style scoped>
.not-found {
    text-align: center;
    margin: 200px 0px 500px 0px;
}
</style>