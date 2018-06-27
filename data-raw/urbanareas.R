library(sf)
library(dplyr, warn.conflicts = FALSE)

ua_url <- "https://github.com/nvkelso/natural-earth-vector/raw/master/geojson/ne_10m_urban_areas.geojson"
pp_url <- "https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/ne_10m_populated_places.geojson"
cntry_url <- "https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/ne_10m_admin_0_countries.geojson"

urbanareas <- st_read(ua_url)
places <- st_read(pp_url)
countries <- st_read(cntry_url)

places <- dplyr::select(places,NAME,POP_MAX,POP_MIN,wikidataid)

urbanareas$area_id <- rownames(urbanareas)
places_centers <- st_join(places,urbanareas)[,c('area_id')]
urbanareas <- st_join(urbanareas,places)
rm(places_point)
urbanareas <- urbanareas[!is.na(urbanareas$NAME),]

urbanareas <- urbanareas %>%
  group_by(area_id) %>%
  arrange(desc(POP_MAX)) %>%
  mutate(name = NAME[row_number() == 1L],
         namecount = n(),
         allnames = paste0(NAME, collapse = ", "),
         wikidataids = paste0(wikidataid, collapse = ", "),
         pop_max =  sum(POP_MAX),
         pop_min =  sum(POP_MIN)) %>%
  distinct(name,allnames,area_sqkm,namecount,wikidataids, area_id, pop_max, pop_min, geometry) %>%
  ungroup()

st_write(urbanareas, "data-raw/urbanareas.geojson", delete_dsn = TRUE)
devtools::use_data(urbanareas, compress="bzip2", overwrite = TRUE)
