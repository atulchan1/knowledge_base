# File to Flows Mapping

This document provides an inverted index, mapping each source file to the application flow(s) it participates in. This is useful for understanding the impact of changing a specific file.

### `src/App.tsx`
- `flow-001`: Application Loading
- `flow-002`: User Authentication
- `flow-003`: Puzzle Selection & Configuration
- `flow-007`: User Logout

### `src/api.ts`
- `flow-002`: User Authentication
- `flow-003`: Puzzle Selection & Configuration
- `flow-004`: Authenticated API Requests
- `flow-005`: Pawn Promotion
- `flow-006`: Puzzle Resolution
- `flow-007`: User Logout

### `src/Chessboard.tsx`
- `flow-004`: Authenticated API Requests
- `flow-005`: Pawn Promotion
- `flow-006`: Puzzle Resolution

### `src/config.ts`
- `flow-002`: User Authentication
- `flow-004`: Authenticated API Requests

### `src/LoginPage.tsx`
- `flow-002`: User Authentication

### `src/main.tsx`
- `flow-001`: Application Loading

### `src/PromotionModal.tsx`
- `flow-005`: Pawn Promotion

### `src/PuzzleHomePage.tsx`
- `flow-003`: Puzzle Selection & Configuration
- `flow-007`: User Logout

### `src/Square.tsx`
- `flow-004`: Authenticated API Requests (as part of the broader gameplay)

### `src/vite-env.d.ts`
- (Build-time support, not directly in a runtime flow)
