<template>
  <div class="movies-pagination d-flex justify-content-center">
    <b-pagination
      v-model="currentPageModel"
      :per-page="perPage"
      :total-rows="total"
      prev-text="Prev"
      next-text="Next"
    />
  </div>
</template>

<script>
export default {
  name: "MoviesPagination",
  props: {
    currentPage: {
      type: Number,
      default: 1,
    },
    total: {
      type: Number,
      default: 1,
    },
    perPage: {
      type: Number,
      default: 1,
    },
  },
  computed: {
    currentPageModel: {
      get() {
        return this.currentPage;
      },
      set(value) {
        this.$emit("pageChanged", value);
      },
    },
  },
};
</script>

<style scoped>
.movies-pagination {
  margin-top: auto;
}

.movies-pagination >>> .pagination .page-item .page-link {
  background-color: transparent;
  font-size: 18px;
  color: black;
  box-shadow: none;
  border-color: black;
}

.movies-pagination >>> .pagination .page-item.active .page-link {
  background-color: #000;
  border-color: #000;
  color: #fff;
}

.movies-pagination >>> .pagination .page-item.disabled .page-link {
  color: gray;
}
</style>
