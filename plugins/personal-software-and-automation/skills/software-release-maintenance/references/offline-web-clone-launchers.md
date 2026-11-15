# Offline web clone and Windows launcher reliability

Applies to locally hosted educational websites and static SPA clones launched by double-clicking a .bat file.

## Diagnose black/blank screen after restart
1. Inspect browser console and Network for 404, failed module loads, CSP/CORS, service-worker caching, and JavaScript runtime errors.
2. Distinguish a saved HTML shell from a complete application: dynamic JS chunks, CSS, fonts, images, data files, routes, and API dependencies may be missing.
3. Verify asset paths with both root and nested routes; SPA hash routes and history routes require different server behavior.
4. Reopen after fully stopping the server and CMD, not only refreshing a warm browser tab. Test offline if offline support is promised.
5. Check stale cache/service workers and mismatched content hashes; invalidate safely without masking missing assets.

## Reliable .bat launcher
- Use the batch file's own directory (`%~dp0`) for paths; do not assume the caller's current working directory.
- Check that runtime and entry point exist, report actionable errors, and avoid reinstalling dependencies on every launch.
- Check whether the intended port is already bound by the correct service; avoid launching duplicates or killing unrelated processes.
- Start the server, wait for an actual readiness probe, then open the browser to the correct localhost URL.
- Do not close the server process immediately after launching the browser. Provide a predictable shutdown method.
- Use unique, documented ports for multiple local sites; test every launcher individually and in parallel.

## Verification matrix
- Fresh machine / no cache
- Restart after CMD close
- Repeated double-click
- Port occupied
- Offline network
- Deep link / hash route
- Missing dependency or asset
- Multiple websites concurrently

Respect original website licenses, ownership, and access rules. A visual clone is not proof that original backend functions or licensed content are available offline.
