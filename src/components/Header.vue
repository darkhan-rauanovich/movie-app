<template>
  <header class="header">
    <b-navbar type="dark" class="navbar" variant="dark">
      <b-container>
        <b-navbar-brand href="#">MovieDB</b-navbar-brand>
        <b-nav-form>
          <b-form-input
            class="mr-sm-2 search-input"
            placeholder="Search"
            v-model="searchValue"
            debounce="700"
          ></b-form-input>
        </b-nav-form>
      </b-container>
    </b-navbar>
  </header>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "HeaderApp",
  data: () => ({
    searchValue: "",
  }),
  watch: {
    searchValue: "onSearchValueChange",
  },
  methods: {
    onSearchValueChange(val) {
      if (val) {
        this.searchMovies(val);
        this.toggleSearchState(true);
      } else {
        this.fetchMovies();
        this.toggleSearchState(false);
      }
    },
    ...mapActions("movies", [
      "searchMovies",
      "fetchMovies",
      "toggleSearchState",
    ]),
  },
};
</script>

<style scoped>
.header {
  margin-bottom: 30px;
}

.navbar {
  background-color: rgba(0, 0, 0, 0.7) !important;
}

.navbar li {
  list-style: none;
}

.search-input {
  color: #000;
  background: rgba(255, 255, 255, 0.5);
  border-color: rgba(0, 0, 0, 0.6);
}

.search-input:focus::placeholder {
  color: #000;
}

.search-input:focus {
  box-shadow: none;
  background: rgba(255, 255, 255, 1);
}
</style>
