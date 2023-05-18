SELECT TOP 10 h.team_abbreviation HomeTea, a.team_abbreviation AwayTeam, COUNT(*) MatchupCount
 FROM HomeGames h
	JOIN GameInfo g
	ON h.game_id = g.game_id
		JOIN AwayGames a
		ON a.game_id = g.game_id
GROUP BY h.team_abbreviation, a.team_abbreviation
ORDER BY COUNT(*) DESC