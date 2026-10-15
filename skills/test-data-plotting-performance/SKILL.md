---
name: test-data-plotting-performance
description: Design, optimize, and troubleshoot engineering data plotting applications for long-duration CSV/live measurements, multiple tabs and signals, dual axes, presets, annotations, PDF reports, fading history, decimation, and responsive UI performance. Use for Python or desktop graphing tools that must run for hours or days.
---

# Test Data Plotting Performance

Keep logging fidelity separate from display density. A plot should not render every historical sample just because the logger stores it.

## Performance architecture

Separate:
- raw/log storage
- in-memory working buffer
- visible plotting window
- downsampled historical overview
- report/export pipeline

## Long-run strategy

For day-scale runs:
- store full-resolution data to disk when required
- keep bounded points per visible trace
- decimate/downsample old data
- update UI at a lower frequency than acquisition when possible
- avoid rebuilding every series on every tick
- reuse plot objects instead of recreating controls

## Fade model

If old traces visually fade:
- compute age from timestamps
- apply fading only to visible rendered segments
- do not duplicate historical data for each opacity level
- keep a hard memory/point cap

## Multiple tabs/signals

When many tabs and signals are active:
- update only visible tab at full rate when acceptable
- throttle background tabs
- batch UI updates
- cache axis calculations
- avoid autoscale on every sample

## Axis controls

Support both:
- auto-fit range
- manual Y min/max/step

For primary and secondary axes, keep settings independent and provide an explicit “Apply All” only when the user requests common scales across tabs.

## UI features

Useful engineering plotting features:
- dual Y axes
- Time/Div
- rectangle zoom
- pan/scroll
- A/B cursors
- annotations
- presets
- report/PDF export
- data-series workspace

Each feature should have a clear state model and should not trigger unnecessary full-plot redraws.

## Debugging disappearing plots

If a graph vanishes after hours:
- check buffer eviction logic
- verify x-axis range vs retained timestamps
- inspect NaN/invalid data handling
- check UI thread exceptions
- verify series is not cleared during resource cleanup
- inspect integer/time range assumptions
- reproduce with accelerated synthetic data

## Smooth scrolling and layout stability

For live plots with pan/zoom and Time/Div:
- Maintain one authoritative visible X-axis range and apply viewport changes atomically.
- Avoid toggling scrollbar visibility or reconstructing its bounds on every incoming sample; this can cause flicker/jumps.
- Pause auto-follow while the user pans, then resume only on explicit action.
- Clamp the viewport when old points are evicted without silently resetting the chosen Time/Div.
- Throttle redraws independently of raw acquisition; do not discard logged samples.
- Test scrolling during live updates, resizing, tab switching, and long-run buffer rotation.

For split-panel sizing bugs, inspect runtime assignments, resize handlers, persisted preferences, and Designer defaults; a changed initial SplitterDistance may be overwritten later.

## Regression checks

Test:
- short run
- multi-hour simulated run
- tab switching
- max signal count
- manual/auto axes
- preset reload
- export/report after long run
- data gap/reconnect
- memory and CPU trend over time
