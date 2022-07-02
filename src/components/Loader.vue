<template>
  <div v-if="isShowLoader" class="loader-wrap">
    <b-spinner label=""></b-spinner>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "LoaderApp",
  computed: {
    ...mapGetters(["isShowLoader"]),
  },
};
</script>

<style scoped>
.loader-wrap {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  background-color: rgba(255, 255, 255, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 999;
}
</style>
