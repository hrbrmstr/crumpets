#' WIP - List the current user's organizations
#'
#' @md
#' @note NOT IMPLEMENTED YET
#'
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return something
#' @export
#' @examples \dontrun{
#' }
org_list_current_user_orgs <- function(api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                                       gitea_token = Sys.getenv("GITEA_PAT")) {
  stop("Not implemented yet")

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", s("^/", "", "/user/orgs"))

  httr::VERB(
    verb = "GET",
    url = gitea_url,
    body = list(),
    query = list(access_token = gitea_token),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets"),
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  invisible(out)
}
