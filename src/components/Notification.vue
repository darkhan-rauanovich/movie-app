<template>
  <div></div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "NotifyElement",
  computed: {
    ...mapGetters(["messagePool"]),
  },
  watch: {
    messagePool: "showNotification",
  },
  methods: {
    showNotification({ variant, msg, title }) {
      this.$bvToast.toast(msg, {
        title,
        variant,
        solid: true,
        autoHideDelay: 5000,
      });
    },
  },
};
</script>

<style scopde></style>
