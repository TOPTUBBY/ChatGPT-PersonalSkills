# Reusing an older Android phone as a local AI voice/touch client

A low-cost architecture separates an older Android handset from compute-intensive AI inference.

## Layers
1. Android browser/PWA or lightweight client: microphone permission, push-to-talk, text UI, audio playback, reconnect state.
2. Local PC/NAS backend: authenticated HTTPS API, session handling, request queue, model orchestration, optional tools.
3. STT / LLM / TTS: choose CPU/GPU-aware models and test latency separately.
4. Observability: structured error categories, request duration, resource use, and user-visible offline states.

## Practical constraints
- Old Android WebView/browser versions may lack current Web APIs; test actual microphone permissions, TLS trust, codec support, and page lifecycle on the device.
- Run large language models on the PC/NAS, not on the handset by default.
- Do not expose an unauthenticated local agent endpoint to the internet or give tool execution unrestricted filesystem/shell access.
- Keep voice recordings and transcripts local by default; document retention and deletion behavior.
- Evaluate GPU VRAM, memory bandwidth, CPU/RAM fallback, quantization support, driver/runtime compatibility, and measured tokens/s instead of relying on model parameter count alone.

## Phase-1 acceptance tests
- Phone connects to backend on LAN
- Text request and response
- Push-to-talk recording and STT
- LLM response and TTS playback
- Backend disconnect/reconnect
- Wrong credentials / expired session
- Device sleep and browser resume
- No secret tokens embedded in client assets
