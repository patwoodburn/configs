local plugin = {"letieu/jira.nvim"}
plugin.lazy=false
function plugin.config()
  require("jira").setup({
    jira={
      --base=vim.g.JIRA_WEB,
      --email=vim.g.JIRA_USER,
      --token=vim.g.JIRA_TOKEN,
    },
    active_sprint_query = "project = '%s' AND sprint in openSprints() ORDER BY Rank ASC",

  -- Saved JQL queries for the JQL tab
  -- Use %s as a placeholder for the project key
    queries = {
      ["Next sprint"] = "project = '%s' AND sprint in futureSprints() ORDER BY Rank ASC",
      ["Backlog"] = "project = '%s' AND (issuetype IN standardIssueTypes() OR issuetype = Sub-task) AND (sprint IS EMPTY OR sprint NOT IN openSprints()) AND statusCategory != Done ORDER BY Rank ASC",
      ["My Tasks"] = "assignee = currentUser() AND statusCategory != Done ORDER BY updated DESC",
    },
    projects = {
      ["CODA"] = {}
    }
  })
end
return plugin

