#' Get the authenticated user
#'
#' @md
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return `list`
#' @export
#' @examples \dontrun{
#' user_get_current()
#' }
user_get_current <- function(api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                             gitea_token = Sys.getenv("GITEA_PAT")) {

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", sub("^/", "", "/user"))

  httr::VERB(
    verb = "GET",
    url = gitea_url,
    query = list(access_token = gitea_token),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  out
}
