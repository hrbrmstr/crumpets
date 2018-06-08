#' Migrate a remote git repository
#'
#' @md
#' @param clone_url `git://example.com/owner/repo[.git]`-style URL
#' @param repo_name name for the gitea repo
#' @param uid numeric. Get it from [user_get()] or [user_get_current()]. If you're the
#'        first/only users this is very likely `1`. If `NULL` will use [user_get_current()].
#' @param description repo description
#' @param mirror should this be a mirror? defaults to `TRUE`
#' @param private should this default to "private"? defaults to `TRUE`
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return `list`
#' @export
#' @examples \dontrun{
#' repo_migrate("git://github.com/hrbrmstr/ssllabs", "sslabs")
#' }
repo_migrate <- function(clone_url,
                         repo_name,
                         uid = NULL,
                         description = "",
                         mirror = TRUE,
                         private = FALSE,
                         api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                         gitea_token = Sys.getenv("GITEA_PAT")) {

  if (is.null(uid)) uid <- user_get_current()$id

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", sub("^/", "", "/repos/migrate"))

  httr::VERB(
    verb = "POST",
    url = gitea_url,
    body = list(
      clone_addr = clone_url,
      description = description,
      mirror = mirror,
      private = private,
      repo_name = repo_name,
      uid = uid
    ),
    query = list(access_token = gitea_token),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  out
}
