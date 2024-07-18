local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-rdf4j') {
  settings+: {
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/rdf4j/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
    orgs.newOrgWebhook('https://hooks.slack.com/services/T2Y87UJE8/B319N3P6J/*') {
      content_type: "json",
      events+: [
        "commit_comment",
        "create",
        "delete",
        "deployment_status",
        "fork",
        "issue_comment",
        "issues",
        "pull_request",
        "pull_request_review_comment",
        "push",
        "release"
      ],
    },
    orgs.newOrgWebhook('https://webhooks.gitter.im/e/*') {
      content_type: "json",
      events+: [
        "*"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('rdf4j') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse RDF4J: scalable RDF for Java",
      has_discussions: true,
      has_wiki: false,
      homepage: "https://rdf4j.org/",
      merge_commit_message: "BLANK",
      merge_commit_title: "PR_TITLE",
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "hacktoberfest",
        "java",
        "linked-data",
        "rdf",
        "semantic-web",
        "shacl",
        "sparql"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://hooks.slack.com/services/T2Y87UJE8/B319N3P6J/*') {
          content_type: "json",
          events+: [
            "commit_comment",
            "create",
            "delete",
            "deployment_status",
            "fork",
            "issue_comment",
            "issues",
            "pull_request",
            "pull_request_review_comment",
            "push",
            "release"
          ],
        },
        orgs.newRepoWebhook('https://webhooks.gitter.im/e/496bb293a006a241d0a7') {
          content_type: "json",
          events+: [
            "*"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('ADD_TO_PROJECT_PAT') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('develop') {
          required_approving_review_count: null,
          required_status_checks+: [
            "any:build (11)"
          ],
          requires_pull_request: false,
        },
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          required_status_checks+: [
            "any:build (11)"
          ],
          requires_pull_request: false,
        },
      ],
    },
  ],
}
