#' WIP - Get a commit's combined status, by branch/tag/commit reference
#'
#' @md
#' @note NOT IMPLEMENTED YET
#' @param api_endpoint URL prefix for your gitea server
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return something
#' @export
#' @examples \dontrun{
#' }
repo_get_combined_status_by_ref <- function(api_endpoint = Sys.getenv('GITEA_BASE_URL'),
                    gitea_token = Sys.getenv('GITEA_PAT')) {

  stop('Not implemented yet')

  httr::VERB(
    verb = 'GET',
    url = 'http://bigd:3000/api/v1/repos/{owner}/{repo}/commits/{ref}/statuses',
    body = list(),
    query = list(
      access_token = gitea_token
    ),
    encode = 'json',
    httr::user_agent('crumpets r package <https://gitlab.com/hrbrmstr/crumpets'),
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as='text')
  out <- jsonlite::fromJSON(out)

  invisible(out)

}
