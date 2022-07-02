<template>
  <div id="app">
    <LoaderApp />
    <NotifyElement />
    <PosterBg :poster="posterBg" />
    <HeaderApp />
    <MoviesList :list="moviesList" @changePoster="onChangePoster" />
    <MoviesPagination
      :current-page="currentPage"
      :per-page="moviesPerPage"
      :total="moviesLength"
      @pageChanged="onPageChanged"
    />
    {{ (currentPage, moviesPerPage, moviesLength) }}
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import MoviesList from "@/components/MoviesList.vue";
import PosterBg from "@/components/PosterBg.vue";
import MoviesPagination from "@/components/MoviesPagination.vue";
import LoaderApp from "@/components/Loader.vue";
import HeaderApp from "@/components/Header.vue";
import NotifyElement from "@/components/Notification.vue";

export default {
  name: "App",
  components: {
    MoviesList,
    PosterBg,
    MoviesPagination,
    LoaderApp,
    HeaderApp,
    NotifyElement,
  },
  data: () => ({
    posterBg: "",
  }),
  computed: {
    ...mapGetters("movies", [
      "moviesList",
      "currentPage",
      "moviesPerPage",
      "moviesLength",
    ]),
  },
  methods: {
    ...mapActions("movies", ["fetchMovies", "changeCurrentPage"]),
    onChangePoster(poster) {
      this.posterBg = poster;
    },
    onPageChanged(page) {
      this.changeCurrentPage(page);
    },
  },
};
</script>

<style>
#app {
  font-family: Arial, Helvetica, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  position: relative;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.toast:not(.show) {
  display: block;
}
</style>
