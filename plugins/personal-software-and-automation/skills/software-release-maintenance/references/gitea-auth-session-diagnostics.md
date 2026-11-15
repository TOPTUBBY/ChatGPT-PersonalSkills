# Gitea organization publish and authentication diagnostics

Use this reference when a Git desktop client can sign in but cannot publish to an organization, returns HTTP 403, or mislabels remote errors as authentication failures.

## Separate the failure domains
1. Confirm the user can create a repository in the target organization using Gitea Web UI. Membership alone does not guarantee repository-creation rights.
2. Inspect the API request target (user versus organization), HTTP method, URL path, and status. Distinguish 401 (authentication), 403 (authorization/policy), 404 (wrong path or hidden resource), network/TLS failures, and Git transport errors.
3. Compare the authenticated identity, token/session, cached credentials, organization list, and permissions. A stale remembered sign-in may retain old scopes or identity after a permission change.
4. Re-authenticate without relying on stale cached session state; refresh organization permissions and retry only after verifying the selected owner.
5. Avoid blanket 'Authentication failed' messages for missing repositories or bad remote paths; show actionable, sanitized diagnostics.

## Desktop UX and regression tests
- Keep owner/organization selection explicit; refresh when the session changes.
- Do not silently reuse a Windows-account remembered sign-in when the user explicitly signs out or switches accounts.
- Keep repository-name input usable at realistic lengths; validate illegal characters without truncating valid names.
- Test account switch, expired credentials, permission changes, organization publish, wrong remote URL, offline host, and recoverable HTTP errors.
- Never log access tokens, passwords, cookies, private endpoints, or full credential-bearing URLs.

## Local HTTPS and Git clients
- A locally issued CA certificate is trusted only on devices whose trust store includes that CA; HTTPS redirection alone does not create trust.
- Validate certificate SAN against the actual host/IP, validity period, chain, service configuration, and browser/client trust independently.
- Browsers, Git for Windows, and portable Git can use different certificate backends/stores; test each actual client.
- Do not disable TLS verification as a permanent fix or claim zero-client-configuration trust for a private CA.
- Keep home NAS deployments separate from workplace Git hosting and enterprise IT policy.
