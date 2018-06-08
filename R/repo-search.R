#' WIP - Search for repositories
#'
#' @md
#' @note NOT IMPLEMENTED YET
#' @param q keyword
#' @param uid search only for repos that the user with the given id owns or contributes to
#' @param page page number of results to return (1-based)
#' @param limit page size of results, maximum page size is 50
#' @param mode type of repository to search for. Supported values are "fork", "source", "mirror" and "collaborative"
#' @param exclusive if `uid` is given, search only for repos that the user owns
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return something
#' @export
#' @examples \dontrun{
#' }
repo_search <- function(q, uid, page, limit, mode, exclusive, api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                        gitea_token = Sys.getenv("GITEA_PAT")) {
  stop("Not implemented yet")

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", s("^/", "", "/repos/search"))

  httr::VERB(
    verb = "GET",
    url = gitea_url,
    body = list(),
    query = list(
      `q` = `q`,
      `uid` = `uid`,
      `page` = `page`,
      `limit` = `limit`,
      `mode` = `mode`,
      `exclusive` = `exclusive`,
      access_token = gitea_token
    ),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets"),
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  invisible(out)
}
