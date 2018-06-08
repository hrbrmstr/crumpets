#' Get an archive of a repository
#'
#' @md
#' @param owner owner of the repo
#' @param repo name of the repo
#' @param archive archive to download, consisting of a git reference and archive
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return raw vector
#' @export
#' @examples \dontrun{
#' x <- repo_get_archive("hrbrmstr", "gdns", "", "master.zip")
#' tf <- tempfile(fileext = ".zip")
#' writeBin(x, con = tf, useBytes=TRUE)
#' }
repo_get_archive <- function(owner, repo, archive, filepath,
                             api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                             gitea_token = Sys.getenv("GITEA_PAT")) {

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", sub("^/", "", "/repos/{owner}/{repo}/archive/{filepath}"))
  glue::glue_data(
    list(
      owner=owner,
      repo=repo,
      archive=archive,
      filepath=filepath
    ),
    gitea_url
  ) -> gitea_url

  httr::VERB(
    verb = "GET",
    url = gitea_url,
    query = list(
      `owner` = `owner`,
      `repo` = `repo`,
      `archive` = `archive`,
      access_token = gitea_token
    ),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "raw")

  invisible(out)

}
