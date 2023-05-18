SELECT TOP 10 Team1, Team2, COUNT(*) MatchupCount

FROM (
	SELECT
		CASE
			WHEN h.team_abbreviation < a.team_abbreviation THEN h.team_abbreviation
				ELSE a.team_abbreviation
				END AS Team1,
		CASE
			WHEN h.team_abbreviation > a.team_abbreviation THEN h.team_abbreviation
				ELSE a.team_abbreviation
				END AS Team2

	 FROM HomeGames h
		JOIN GameInfo g
		ON h.game_id = g.game_id
			JOIN AwayGames a
			ON a.game_id = g.game_id
	 ) AS sub

 GROUP BY Team1, Team2
 ORDER BY COUNT(*) DESC