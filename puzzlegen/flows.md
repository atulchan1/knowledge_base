# Puzzlegen Application Flows

This document outlines the main data processing flows for the Puzzlegen command-line application. The application is designed as a pipeline to generate chess puzzles from real games.

**Note:** The core logic of this application is currently disabled via commented-out code.

### `flow-pg-001`: Download and Parse PGNs
- **Description**: The application starts by making an HTTP request to the public chess.com API to download a month's worth of games (in PGN format) for a hardcoded user ("chess_retry"). It then manually parses the raw PGN text, separating game metadata (like player names) from the move lists, and structures them into `Game` objects.
- **Trigger**: Executing the `main` method of the application.
- **Status**: **Active**.

### `flow-pg-002`: Find Missed Tactics
- **Description**: This flow is intended to replay each downloaded game, move by move. At each position, it uses the Stockfish engine to find the top 3 best moves. It compares the move actually played in the game to the engine's suggestions. If the played move is a significant blunder compared to the best move, the position is identified as a "missed tactic" and the board's FEN string is written to `output.log`.
- **Trigger**: This would be called automatically after parsing the games.
- **Status**: **Inactive**. The call to the `checkMissedTactic` method responsible for this logic is currently commented out in `TacticschessApplication.java`.

### `flow-pg-003`: Refine Puzzles
- **Description**: This final flow is designed to read the raw puzzle candidates from `output.log`. For each candidate, it performs a deeper analysis with Stockfish to determine the puzzle's characteristics (e.g., is it a checkmate? what is the centipawn advantage?). It then formats this data and writes the final, complete puzzle to `output_refined.log`, which is the file used by the `tacticschess` backend.
- **Trigger**: This would be called from the `main` method.
- **Status**: **Inactive**. The call to the `finalizeTactics()` method responsible for this entire flow is currently commented out in `TacticschessApplication.java`.
