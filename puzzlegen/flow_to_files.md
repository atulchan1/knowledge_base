# Flow to Files Mapping

This document maps the Puzzlegen application flows to the source code files primarily responsible for their implementation.

### `flow-pg-001`: Download and Parse PGNs
- `TacticschessApplication.java`: Contains the `donwloadGamesAndFindTactics` and `createGames` methods which orchestrate the download and parsing logic. Uses Java's built-in `HttpClient`.
- `model/Game.java`: Data model for a parsed game, containing metadata.
- `model/MovePair.java`: Data model for a pair of moves (White and Black) in a game.
- `util/NotationUtil.java`: Used to convert move notations (e.g., SAN to UCI) during the game replay phase.

### `flow-pg-002`: Find Missed Tactics (Inactive)
- `TacticschessApplication.java`: Contains the `playGames`, `checkMissedTactic`, and `getMissedMoveSuggestion` methods that implement the core tactic-finding logic.
- `util/StockFishClient.java`: Crucial for this flow, as it's used to get the top 3 engine moves for comparison.
- `domain/Board.java`: Used to replay the game and generate FEN strings for analysis.

### `flow-pg-003`: Refine Puzzles (Inactive)
- `TacticschessApplication.java`: Contains the `finalizeTactics` and `getCentipawnsForRounds` methods that perform the final analysis and write the output file.
- `util/StockFishClient.java`: Used again to get detailed centipawn evaluations for the refined puzzles.
- `domain/Board.java`: Used to play out puzzle variations.
