# Scenic Project Details & Structure

## Project Overview
**Scenic** is a modern movie and TV series discovery application built with React. It leverages the TMDB (The Movie Database) API to provide users with trending content, detailed information about movies and shows, search capabilities, and multi-server streaming options.

### Key Features
- **Discovery**: Hero carousel for trending content, category-based browsing (popular, top-rated, etc.).
- **Streaming**: Multi-server video player for both movies and TV episodes.
- **Search**: Debounced global search functionality.
- **Details**: Comprehensive info pages including trailers, cast, and related recommendations.
- **Responsive**: Optimized for mobile, tablet, and desktop views with a dedicated mobile navigation.

## Technical Stack
- **Framework**: React 18 (built with `react-scripts`)
- **Routing**: React Router DOM v6
- **State Management**: React Hooks (suspense for lazy loading)
- **Styling**: SCSS Modules & Mantine UI (v8)
- **Animations**: Framer Motion & Swiper.js
- **API Client**: Axios (with custom interceptors)
- **Data Source**: TMDB API

## Project Structure

```text
scenic/
├── public/                 # Static public assets
├── src/
│   ├── api/                # API communication layer
│   │   ├── apiConfig.js    # TMDB API base configuration
│   │   ├── axiosClient.js  # Axios instance with interceptors
│   │   └── tmdbApi.js      # API endpoints definitions
│   ├── assets/             # Images, icons, and font assets
│   ├── components/         # Reusable UI components
│   │   ├── header/         # Site navigation header
│   │   ├── footer/         # Site footer
│   │   ├── hero-slide/     # Main page carousel
│   │   ├── movie-card/     # Item cards for grids
│   │   ├── movie-grid/     # Grid layout for content
│   │   ├── video-player-modal/ # Modal for streaming
│   │   └── ...             # Misc common components
│   ├── config/             # App-wide configurations (e.g. Routes)
│   ├── constants/          # Global constant values
│   ├── pages/              # Main page views
│   │   ├── home/           # Landing page
│   │   ├── detail/         # Movie/TV detail view
│   │   └── Catalog.jsx     # Generic catalog page
│   ├── scss/               # Global SCSS variables and mixins
│   ├── theme/              # Mantine UI theme configuration
│   ├── App.js              # Main application entry point & router
│   ├── App.scss            # Root styles
│   ├── index.js            # React DOM rendering entry
│   └── theme.js            # Mantine theme definition
├── package.json            # Project dependencies and scripts
└── README.md               # Project documentation
```

## Route Mapping
| Path | Component | Description |
| :--- | :--- | :--- |
| `/` | `Home` | Trending movies/shows and highlights |
| `/:category` | `Catalog` | Movie or TV series overview |
| `/:category/type/:type` | `Catalog` | Filtered list (e.g. /movie/type/popular) |
| `/:category/:id` | `Detail` | Detailed info and player for a specific title |
| `/:category/search/:keyword` | `Catalog` | Keyword search within a category |
| `/search/:keyword` | `MultiSearch` | Global search across all categories |

## Environment Configuration
The project requires a TMDB API key and optional server URLs for streaming:
- `REACT_APP_API_KEY`: TMDB API Key
- `REACT_APP_MOVIE_SERVER1-10`: Movie streaming server URLs
- `REACT_APP_TV_SERVER1-10`: TV series streaming server URLs
