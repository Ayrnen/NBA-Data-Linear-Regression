SELECT
	MAX(CAST(h.total_points AS INT)) MaxHome,
	MAX(CAST(a.total_points as INT)) MaxAway,
	(SELECT MAX(val)
		FROM (VALUES
			(MIN (CAST(h.total_points AS INT))),
			(MIN (CAST(a.total_points AS INT))))
			AS value(val)) AS [MinBoth]

 FROM HomeGames h
	JOIN AwayGames a
	ON h.game_id = a.game_id
 WHERE CAST(a.total_points AS INT) > 1 AND CAST(h.total_points AS INT) > 1