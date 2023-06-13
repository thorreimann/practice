#' Title
#'
#' @param data data.frame
#' @param x useful info
#'
#' @return data.frame
#' @export
#'
n<-NULL

top10 <- function(data, x){
  # Find the 10 top based on x
  top10x <- dplyr::count(data, {{x}}) |>
    dplyr::slice_max(n = 10, order_by = n) |>
    dplyr::select({{x}}) |>
    dplyr::pull()
  # Filter dataset to only the 10 top based on x
  return(dplyr::filter(data, {{x}} %in% top10x))
}
