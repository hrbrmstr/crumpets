#' Sync a mirrored repository
#'
#' @md
#' @param owner repo owner string
#' @param repo repo string
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return nothing if successful
#' @export
#' @examples \dontrun{
#' repo_mirror_sync("hrbrmstr", "crumpets")
#' }
repo_mirror_sync <- function(owner, repo,
                             api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                             gitea_token = Sys.getenv("GITEA_PAT")) {

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", sub("^/", "", "/repos/{owner}/{repo}/mirror-sync"))
  gitea_url <- glue::glue_data(list(owner=owner, repo=repo), gitea_url)

  httr::VERB(
    verb = "POST",
    url = gitea_url,
    body = list(),
    query = list(access_token = gitea_token),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets")
  ) -> res

  httr::stop_for_status(res)

  invisible()
}
