#' WIP - List the repositories watched by a user
#'
#' @md
#' @note NOT IMPLEMENTED YET
#' @param username username of the user
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return something
#' @export
#' @examples \dontrun{
#' }
user_list_subscriptions <- function(username, api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                                    gitea_token = Sys.getenv("GITEA_PAT")) {
  stop("Not implemented yet")

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", sub("^/", "", "/users/{username}/subscriptions"))

  httr::VERB(
    verb = "GET",
    url = gitea_url,
    body = list(),
    query = list(
      `username` = `username`,
      access_token = gitea_token
    ),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  invisible(out)
}
