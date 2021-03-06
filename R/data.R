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
#' #' \describe{
#' \item{\code{allnames}}{all city names falling within the urban area}
#' \item{\code{namecount}}{number of named city centers falling within the urban area}
#' \item{\code{area_sqkm}}{total square km of the urban area}
#' \item{\code{pop_max}}{maximum estimate for population (based on landscan)}
#' \item{\code{pop_min}}{minumum estimate for population (based on landscan)}
#' \item{\code{wikidataids}}{all ids of the widata entry for the city. same order as allnames. e.g. Paris is Q90, so https://www.wikidata.org/wiki/Q90}
#' \item{\code{geometry}}{The geographic area that the urban area covers. Derived from 2001-2003 Satellitte Imagery}
#' }
#'
#'   \code{name}, \code{allnames}, \code{namecount}, \code{area_sqkm}, \code{pop_max} and \code{pop_min},
#'   \code{wikidataids}, and \code{geometry}.
#' @examples
#'   library(sf)
#'   urbanareas
"urbanareas"
