#' @importFrom tibble tibble
NULL

#' Urban Areas.
#'
#' Named urban areas with more than 100k in minimum estimated population.
#' Area data derived from satellite imagery (NASA/MODIS).
#' Place names from Washington Post/NaturalEarthData.
#' Population estimates from Landscan.
#'
#' Area Source: Schneider, A., M. A. Friedl, D. K. McIver, and C. E. Woodcock (2003) Mapping urban areas by fusing multiple sources of coarse resolution remotely sensed data. Photogrammetric Engineering and Remote Sensing, volume 69, pages 1377-1386.
#'
#' @format A simple features data frame with five variables:
#'   \code{name}, \code{allnames}, \code{namecount}, \code{area_sqkm}, \code{pop_max} and \code{pop_min},
#'   \code{wikidataids}, and \code{geometry}.
"urbanareas"
